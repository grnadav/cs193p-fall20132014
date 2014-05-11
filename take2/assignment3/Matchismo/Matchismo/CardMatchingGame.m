//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/2/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "CardMatchingGame.h"
#import "GameMove.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray* cards;
@property (nonatomic) NSUInteger matchMode;
@property (nonatomic, strong, readwrite) NSMutableArray* mutableHistory;


@end

@implementation CardMatchingGame

static const int DEFAULT_MATCH_MODE = 2;
static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    
    if (self) {
        for (NSUInteger cardIdx = 0; cardIdx < count; cardIdx++) {
            Card* card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        
    }
    
    return self;
}

- (NSMutableArray *)mutableHistory {
    if (!_mutableHistory) _mutableHistory = [[NSMutableArray alloc] init];
    return _mutableHistory;
}

-(NSArray *)history {
    return self.mutableHistory;
}

- (NSUInteger)matchMode {
    if (!_matchMode) _matchMode = DEFAULT_MATCH_MODE;
    return _matchMode;
}

- (BOOL)setMode:(NSUInteger)matchMode {
    if (matchMode > 1) {
        self.matchMode = matchMode;
        return YES;
    }
    return NO;
}

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    if ([self.cards count] > index) {
        return self.cards[index];
    }
    return nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    int scoreBeforeMove = self.score;
    Card* card = [self cardAtIndex:index];
    NSMutableArray* selectedUnMatchedCards = [[NSMutableArray alloc] init];
    
    // always test who is chosen for history purposes
    for (Card* otherCard in self.cards) {
        if (otherCard.isChosen && !otherCard.isMatched) {
            [selectedUnMatchedCards addObject:otherCard];
        }
    }
    
    if (card.isChosen) {
        card.chosen = NO;
        
        [selectedUnMatchedCards removeObject:card];
        GameMove* move = [[GameMove alloc] initWithCards:selectedUnMatchedCards andScoreChange:(self.score - scoreBeforeMove)];
        [self.mutableHistory addObject:move];
    } else {
        // match against other chosen cards
        
        // only if selected # of cards are exactly as match mode (ex. 3 cards selected in match-3 game mode), do match:
        if ([selectedUnMatchedCards count] == (self.matchMode - 1)) {
            int matchScore = [card match:selectedUnMatchedCards];
            
            if (matchScore) {
                for (Card* otherCard in selectedUnMatchedCards) {
                    otherCard.matched = YES;
                }
                card.matched = YES;
                self.score += matchScore * MATCH_BONUS;
            } else {
                for (Card* otherCard in selectedUnMatchedCards) {
                    otherCard.chosen = NO;
                }
                self.score -= MISMATCH_PENALTY;
            }
        }
        
        NSMutableArray* allSelectedCards = [[NSMutableArray alloc] initWithArray:selectedUnMatchedCards];
        [allSelectedCards addObject:card];
        GameMove* move = [[GameMove alloc] initWithCards:allSelectedCards andScoreChange:(self.score - scoreBeforeMove)];
        [self.mutableHistory addObject:move];
        
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
}

@end

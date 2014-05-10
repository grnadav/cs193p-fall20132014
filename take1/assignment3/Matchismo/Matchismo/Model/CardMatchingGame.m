//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Nadav Greenberg on 12/30/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import "CardMatchingGame.h"
#import "CardMatchingHistory.h"
#import "CardMatchingHistoryItem.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong, readwrite) CardMatchingHistory *actionsHistory;
@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck*)deck {
    self = [super init];
    
    if (self) {
        for (int i=0; i<count; i++) {
            Card* card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }

        }
        
        self.matchCount = 2; // by default we want a match-2 game
    }
    
    return self;
}

- (CardMatchingHistory*)actionsHistory {
    if (!_actionsHistory) _actionsHistory = [[CardMatchingHistory alloc] init];
    return _actionsHistory;
}

- (void)setMatchCount:(NSUInteger)matchCount {
    // only set n-match game if matching 2 or more.
    if (matchCount >= 2) {
        _matchCount = matchCount;
    }
}

- (NSMutableArray*)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    int scoreDiff = 0;
    NSMutableArray *cardsToMatch = [[NSMutableArray alloc] init];
    Card* card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            [self.actionsHistory addItem:[[CardMatchingHistoryItem alloc] initWithCards:@[] withScore:scoreDiff]];
            card.chosen = NO;
        } else {
            // match against other chosen cards
            for (Card* otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [cardsToMatch addObject:otherCard];
                }
            }
            
            // only run the match test if number of cards to match is equal to our game type
            if ([cardsToMatch count] == self.matchCount - 1) {
                // calulate score
                
                [cardsToMatch addObject:card];
                int matchScore = [self matchCards:cardsToMatch];
                if (matchScore) {
                    scoreDiff = matchScore * MATCH_BONUS;
                    self.score += scoreDiff;
                    // mark cards as matched
                    for (Card* otherCard in cardsToMatch) {
                        otherCard.matched = YES;
                    }
                } else {
                    scoreDiff = -MISMATCH_PENALTY;
                    self.score += scoreDiff;
                    // un-choose all chosen cards
                    for (Card* otherCard in cardsToMatch) {
                        otherCard.chosen = NO;
                    }
                }
                card.chosen = YES;
                [self.actionsHistory addItem:[[CardMatchingHistoryItem alloc] initWithCards:cardsToMatch withScore:scoreDiff]];
            } else {
                card.chosen = YES;
                [self.actionsHistory addItem:[[CardMatchingHistoryItem alloc] initWithCards:@[card] withScore:scoreDiff]];
            }
            
            //card.chosen = YES;
            self.score -= COST_TO_CHOOSE;
            
        }
    }
}

- (int) matchCards:(NSArray*)cards{
    int score = 0;
    Card* firstCard = [cards firstObject];
    NSMutableArray *otherCards = [NSMutableArray arrayWithArray:cards];
    [otherCards removeObject:firstCard];
    
    // match first card against all others
    if ([otherCards count] > 0) {
        score += [firstCard match:otherCards];
        score += [self matchCards:otherCards];
    }
    return score;
}

- (void)addMatchToHistory:(NSArray*)cards score:(int)score {
    NSMutableArray* cardsContents = [[NSMutableArray alloc] init];
    for (Card* card in cards) {
        [cardsContents addObject:card.contents];
    }
    
}

- (Card*)cardAtIndex:(NSUInteger)index {
    return index<[self.cards count] ? self.cards[index] : nil;
}


@end

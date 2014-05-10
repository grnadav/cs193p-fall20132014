//
//  Deck.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (nonatomic, strong) NSMutableArray* cards;

@end

@implementation Deck

- (NSMutableArray*)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card*)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card*)card {
    [self addCard:card atTop:NO];
}

- (Card*)drawRandomCard {
    Card* randomCard = nil;
    
    if ([self.cards count]) {
        unsigned int cardIndex = arc4random() % [self.cards count];
        randomCard = self.cards[cardIndex];
        [self.cards removeObjectAtIndex:cardIndex];
    }
    
    return randomCard;
}


@end

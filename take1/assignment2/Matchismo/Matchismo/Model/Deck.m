//
//  Deck.m
//  Matchismo
//
//  Created by Nadav Greenberg on 12/27/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

- (NSMutableArray*)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void) addCard:(Card*)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards setObject:card atIndexedSubscript:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void) addCard:(Card*)card {
    [self addCard:card atTop:NO];
}

- (Card*) drawRandomCard {
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        int randIndex = arc4random() % [self.cards count];
        randomCard = self.cards[randIndex];
        [self.cards removeObjectAtIndex:randIndex];
    }
    
    return randomCard;
}


@end

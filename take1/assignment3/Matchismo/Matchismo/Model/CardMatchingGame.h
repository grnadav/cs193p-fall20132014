//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Nadav Greenberg on 12/30/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "CardMatchingHistory.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck*)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card*)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSUInteger matchCount;
@property (nonatomic, strong, readonly) CardMatchingHistory* actionsHistory;


@end

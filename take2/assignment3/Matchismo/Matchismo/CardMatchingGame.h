//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Nadav Greenberg on 5/2/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck*)deck;

- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card*) cardAtIndex:(NSUInteger)index;
- (BOOL) setMode:(NSUInteger)matchMode;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong, readonly) NSArray* history;

@end

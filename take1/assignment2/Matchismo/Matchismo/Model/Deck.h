//
//  Deck.h
//  Matchismo
//
//  Created by Nadav Greenberg on 12/27/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card*)card atTop:(BOOL)atTop;
- (void) addCard:(Card*)card;

- (Card*) drawRandomCard;
@end

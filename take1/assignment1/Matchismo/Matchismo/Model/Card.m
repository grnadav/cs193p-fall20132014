//
//  Card.m
//  Matchismo
//
//  Created by Nadav Greenberg on 12/27/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards {
    int score = 0;
    
    for (Card* card in otherCards) {
        if ([self.contents isEqualToString:card.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end

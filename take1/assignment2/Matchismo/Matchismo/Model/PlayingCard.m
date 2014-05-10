//
//  PlayingCard.m
//  Matchismo
//
//  Created by Nadav Greenberg on 12/27/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString*)contents {
//    NSLog(@"rank index: %lu", (unsigned long)self.rank);
//    NSLog(@"suit: %@", self.suit);
    return [NSString stringWithFormat:@"%@%@", [[PlayingCard rankStrings] objectAtIndex:self.rank] , self.suit];
}

+ (NSArray*)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray*)validSuits {
    return @[@"♣︎", @"♥︎", @"♦︎", @"♠︎"];
}
+ (NSUInteger)maxRank {
    return [[PlayingCard rankStrings] count] - 1;
}

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString*)suit {
    return _suit ? _suit : @"?";
}

- (void) setRank:(NSUInteger)rank {
    if ([PlayingCard maxRank] >= rank) {
        _rank = rank;
    }
}

- (int) match:(NSArray*)otherCards {
    int score = 0;
    int multiplicationFactor = 1;
    
    // multiply the reward with each successful match
    for (PlayingCard* otherCard in otherCards) {
        if (otherCard.rank == self.rank) {
            score += 4;
            score *= multiplicationFactor;
            multiplicationFactor *= 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score += 1;
            score *= multiplicationFactor;
            multiplicationFactor *= 2;
        }
    }
    
    return score;
}

@end

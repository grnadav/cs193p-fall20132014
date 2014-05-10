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

@end

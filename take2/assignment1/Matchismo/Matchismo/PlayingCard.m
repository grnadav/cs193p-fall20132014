//
//  PlayingCard.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return  _suit ? _suit : @"?";
}

- (NSString*)contents {
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

+ (NSArray*)validSuits {
    return @[@"♣︎", @"♠︎", @"♥︎", @"♦︎"];
}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count]-1;
}

+ (NSArray*)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (void) setRank:(NSUInteger)rank {
    if (_rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end

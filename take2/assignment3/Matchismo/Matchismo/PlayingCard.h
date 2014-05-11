//
//  PlayingCard.h
//  Matchismo
//
//  Created by Nadav Greenberg on 5/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString* suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*)validSuits;
+ (NSUInteger)maxRank;

@end

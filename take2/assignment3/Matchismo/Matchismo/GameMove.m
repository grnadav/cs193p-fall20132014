//
//  GameMove.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/9/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "GameMove.h"
#import "Card.h"

@interface GameMove()

@property (nonatomic, strong, readwrite) NSString* description;
@property (nonatomic, strong) NSArray* cards;
@property (nonatomic) NSInteger score;

- (NSString*) cardsAsString:(NSArray*)cards;

@end

@implementation GameMove

- (instancetype)initWithCards:(NSArray *)cards andScoreChange:(NSInteger)scoreChange {
    self = [super init];
    
    if (self && cards) {
        self.cards = cards;
        self.score = scoreChange;
    }
    
    return self;
}

- (NSString *)description {
    NSString* cardsString = [self cardsAsString:self.cards];
    NSString* result = cardsString;
    
    if (self.score < 0) {
        result = [NSString stringWithFormat:@"%@ don't match! %d point penalty", cardsString, self.score];
    } else if (self.score > 0) {
        result = [NSString stringWithFormat:@"Matched %@ for %d points.", cardsString, self.score];
    }
    
    return result;
}


- (NSString*) cardsAsString:(NSArray*)cards {
    NSMutableString* result = [[NSMutableString alloc] init];
    
    for (Card* card in self.cards) {
        [result appendString:[NSString stringWithFormat:@"%@ ",card.contents]];
    }
    
    return result;
}


@end

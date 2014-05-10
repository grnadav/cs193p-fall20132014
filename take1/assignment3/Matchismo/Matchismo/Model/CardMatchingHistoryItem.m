//
//  CardMatchingHistoryItem.m
//  Matchismo
//
//  Created by Nadav Greenberg on 1/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "CardMatchingHistoryItem.h"
#import "Card.h"

@interface CardMatchingHistoryItem()
@property (nonatomic, strong) NSMutableArray *cardsMutable;
@property (nonatomic, readwrite) NSInteger score;

@end

@implementation CardMatchingHistoryItem

- (instancetype)initWithCards:(NSArray*)cards
                    withScore:(NSUInteger)score {
    
    self = [super init];
    
    if (self) {
        for (Card* card in cards) {
            [self.cardsMutable addObject:card.contents];
        }
        self.score = score;
    }
    
    return self;
}

- (NSMutableArray*)cardsMutable {
    if (!_cardsMutable) _cardsMutable = [[NSMutableArray alloc] init];
    return _cardsMutable;
}

// although 0 is the default initial state of primitives, this is here so to be explicit about the default value
- (NSInteger)score {
    if (!_score) _score = 0;
    return _score;
}

- (NSArray*)cards {
    return [self.cardsMutable copy];
}

@end

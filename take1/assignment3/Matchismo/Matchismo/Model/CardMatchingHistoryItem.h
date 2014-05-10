//
//  CardMatchingHistoryItem.h
//  Matchismo
//
//  Created by Nadav Greenberg on 1/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardMatchingHistoryItem : NSObject

// designated initializer
- (instancetype)initWithCards:(NSArray*)cards
                    withScore:(NSUInteger)score;

@property (nonatomic, strong, readonly) NSArray *cards;
@property (nonatomic, readonly) NSInteger score;

@end

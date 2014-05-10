//
//  CardMatchingHistory.m
//  Matchismo
//
//  Created by Nadav Greenberg on 1/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "CardMatchingHistory.h"

@interface CardMatchingHistory()
@property (strong, nonatomic) NSMutableArray* historyMutable;
@end

@implementation CardMatchingHistory

- (void) addItem:(CardMatchingHistoryItem*)item {
    [self.historyMutable addObject:item];
}

- (NSMutableArray*)historyMutable {
    if (!_historyMutable) _historyMutable = [[NSMutableArray alloc] init];
    return _historyMutable;
}

- (NSArray*)history {
    return [self.historyMutable copy];
}

@end

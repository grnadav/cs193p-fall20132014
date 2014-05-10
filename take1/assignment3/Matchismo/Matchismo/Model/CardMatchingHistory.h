//
//  CardMatchingHistory.h
//  Matchismo
//
//  Created by Nadav Greenberg on 1/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardMatchingHistoryItem.h"

@interface CardMatchingHistory : NSObject

- (void) addItem:(CardMatchingHistoryItem*)item;

@property (nonatomic, strong, readonly) NSArray* history;

@end


//
//  SetCard.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/11/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

const NSUInteger MAX_NUMBER = 3;

- (NSString *)contents {
    return nil;
}

- (void)setNumber:(NSUInteger)number {
    if (number > 0 && number <= MAX_NUMBER) {
        _number = number;
    }
}

+ (NSUInteger)maxNumber {
    return MAX_NUMBER;
}

@end

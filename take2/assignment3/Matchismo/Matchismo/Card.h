//
//  Card.h
//  Matchismo
//
//  Created by Nadav Greenberg on 5/1/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString* contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray*)otherCards;

@end

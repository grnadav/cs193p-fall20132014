//
//  Card.h
//  Matchismo
//
//  Created by Nadav Greenberg on 12/27/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int) match:(NSArray*)otherCards;

@end

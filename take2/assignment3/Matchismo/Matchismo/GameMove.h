//
//  GameMove.h
//  Matchismo
//
//  Created by Nadav Greenberg on 5/9/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameMove : NSObject

- (instancetype) initWithCards:(NSArray*)cards andScoreChange:(NSInteger)scoreChange;

@property (nonatomic, strong, readonly) NSString* description;

@end

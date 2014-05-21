//
//  SetCard.h
//  Matchismo
//
//  Created by Nadav Greenberg on 5/11/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

typedef enum ShapeType : NSUInteger {
    shape1 = 1,
    shape2,
    shape3
} ShapeType;

typedef enum ShadeType : NSUInteger {
    shade1 = 1,
    shade2,
    shade3
} ShadeType;

typedef enum ColorType : NSUInteger {
    color1 = 1,
    color2,
    color3
} ColorType;


@property (nonatomic) ShapeType shape;
@property (nonatomic) ShadeType shade;
@property (nonatomic) ColorType color;
@property (nonatomic) NSUInteger number;

+ (NSUInteger)maxNumber;
//+ (NSArray*)availableColors;
//+ (NSArray*)availableShapes;
//+ (NSArray*)availableShades;


@end

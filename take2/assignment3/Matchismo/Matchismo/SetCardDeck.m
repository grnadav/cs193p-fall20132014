//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/11/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSInteger count=1; count<= [SetCard maxNumber]; count++) {
            for (ShadeType shade=shade1; shade <= shade3; shade++) {
                for (ShapeType shape=shape1; shape <= shape3; shape++) {
                    for (ColorType color=color1; color <= color3; color++) {
                        SetCard* card = [[SetCard alloc] init];
                        card.number = count;
                        card.shape = shape;
                        card.shade = shade;
                        card.color = color;
                        [self addCard:card];
                    }
                }
            }
        }
        
    }
    return self;
}


@end

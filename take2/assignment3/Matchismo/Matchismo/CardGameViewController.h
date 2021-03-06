//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Nadav Greenberg on 5/1/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// protected
- (Deck*) createDeck;
- (NSAttributedString*)attributedTitleForCard:(Card*)card;
- (UIImage*)backgroundImageForCard:(Card*)card;
- (void) updateUI;

@property (nonatomic) NSUInteger gameMode;

@end

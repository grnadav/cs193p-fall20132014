//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/1/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (nonatomic, strong) PlayingCardDeck* deck;
@end

@implementation CardGameViewController

- (PlayingCardDeck *)deck {
    if (!_deck) [self resetDeck];
    return _deck;
}

- (void) resetDeck {
    self.deck = [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        UIImage* cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        UIImage* cardImage = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        
        Card* card = [self.deck drawRandomCard];
        if (!card) {
            [self resetDeck];
            card = [self.deck drawRandomCard];
        }
        
        [sender setTitle:card.contents forState:UIControlStateNormal];
    }
    self.flipCount++;
}

-(void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    [self.flipsLabel setText:[NSString stringWithFormat:@"Flips: %d", self.flipCount]];
}

@end

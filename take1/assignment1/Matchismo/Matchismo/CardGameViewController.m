//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Nadav Greenberg on 12/27/13.
//  Copyright (c) 2013 Nadav Greenberg. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipsCount;
@property (strong, nonatomic) Deck* deck;
@end

@implementation CardGameViewController

- (void)setFlipsCount:(int)flipsCount {
    _flipsCount = flipsCount;
    [self.flipsLabel setText:[NSString stringWithFormat:@"Flips: %d", flipsCount]];
}

- (IBAction)flipCard:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setTitle:@"" forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
    } else {
        Card *card = [self.deck drawRandomCard];
        if (!card) {
            sender.hidden = YES;
        } else {
            [sender setTitle:card.contents forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];            
        }
    }
    
    self.flipsCount++;
}

- (Deck*)deck {
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

@end

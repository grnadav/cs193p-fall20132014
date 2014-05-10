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
#import "CardMatchingGame.h"
#import "CardMatchingHistoryItem.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameModeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *gameModeSwitch;
@property (nonatomic) NSUInteger matchCount;
@property (nonatomic) NSUInteger flipCount;
@property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@property (weak, nonatomic) IBOutlet UISlider *historySlider;
@end

@implementation CardGameViewController

- (CardMatchingGame*)game {
    if (!_game) _game = [self createGame];
    return _game;
}

- (NSUInteger)matchCount {
    // init with default, which is 2
    if (!_matchCount) {
        _matchCount = 2;
    }
    return _matchCount;
}

- (CardMatchingGame*)createGame {
    return [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
}

- (IBAction)resetGame:(id)sender {
    // unset previous game
    self.game = nil;
    self.game.matchCount = self.matchCount;
    self.flipCount = 0;
    [self updateUI];
}
- (IBAction)historySliderAction:(id)sender {
    self.historyLabel.alpha = 0.5;
    // slider's value is the index of the history item to display, but trucate it
    if ([self.game.actionsHistory.history count] > (int)self.historySlider.value) {
        CardMatchingHistoryItem* historyItem = self.game.actionsHistory.history[(int)self.historySlider.value];
        self.historyLabel.text = [self getHistoryLabelTextForHistoryItem:historyItem];
    }
}

- (IBAction)gameModeSwitch:(id)sender {
    // switch between 2-match to 3-match types
    self.matchCount = self.matchCount == 2 ? 3 : 2;
    self.game.matchCount = self.matchCount;
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    // added explicit conversion to int as the compiler rightfully complains about precision loss possibility
    // but we know that we can only have so many cards on screen.
    // for some reason, the instructor in the couse did not get this warning :(
    int chosenButtonIndex = (int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    ++self.flipCount;
    [self updateUI];
}

- (Deck*)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        // added explicit conversion to int as the compiler rightfully complains about precision loss possibility
        // but we know that we can only have so many cards on screen.
        // for some reason, the instructor in the couse did not get this warning :(
        int indexOfCard = (int)[self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:indexOfCard];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    }
    self.gameModeSwitch.enabled = (self.flipCount == 0);
    self.gameModeLabel.text = [NSString stringWithFormat:@"Game mode: Match %d", (int)self.matchCount];
    CardMatchingHistoryItem* historyItem = [self.game.actionsHistory.history lastObject];
    self.historyLabel.text = [self getHistoryLabelTextForHistoryItem:historyItem];
    [self updateSliderToMax];
    
    // reset label alpha if changed by user's moving the slider
    self.historyLabel.alpha = 1;
}

- (NSString*)titleForCard:(Card*)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage*)backgroundImageForCard:(Card*)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSString*)getHistoryLabelTextForHistoryItem:(CardMatchingHistoryItem*)historyItem {
    NSString *text;
    
    // if the last action did not complete a match flow
    if ([historyItem.cards count] == 0) {
        text = @"";
    } else {
        
            NSMutableString *s = [[NSMutableString alloc] initWithString:@"Selected cards: "];
            for (int i=0; i<[historyItem.cards count]; i++) {
                [s appendString:historyItem.cards[i]];
                [s appendString:@" "];
            }

        // did a card match
        if ([historyItem.cards count] == self.matchCount) {
            if (historyItem.score < 0) {
                [s appendString:[NSString stringWithFormat:@"don't match! %ld points penalty!", (long)historyItem.score]];
            } else {
                [s appendString:[NSString stringWithFormat:@"matched!, %ld points gained", (long)historyItem.score]];
            }
        }

        text = s;
        
    }
    return text;
}

- (void) updateSliderToMax {
    self.historySlider.enabled = YES;
    self.historySlider.maximumValue = [self.game.actionsHistory.history count];
    self.historySlider.value = [self.game.actionsHistory.history count];
}

@end

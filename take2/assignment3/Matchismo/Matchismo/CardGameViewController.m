//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/1/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSelection;
@property (nonatomic) BOOL gameInProgress;
@property (weak, nonatomic) IBOutlet UILabel *moveDescriptionLabel;
@property (weak, nonatomic) IBOutlet UISlider *historySlider;

@end

@implementation CardGameViewController

- (Deck*) createDeck {
    return nil;
}

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (IBAction)touchGameModeSegment:(id)sender {
    if ([sender respondsToSelector:@selector(selectedSegmentIndex)]) {
        UISegmentedControl* control = sender;
        [self.game setMode: control.selectedSegmentIndex == 0 ? 2 : 3];
    }
    
}

-(void)setGameMode:(NSUInteger)gameMode {
    _gameMode = gameMode;
    [self.game setMode: gameMode];
}

- (IBAction)slideHistorySlider:(id)sender {
    self.moveDescriptionLabel.alpha = 0.5;
    
    UISlider* slider = sender;
    int historyItemIndex = (int)(slider.value);
    if ([self.game.history count] > historyItemIndex) {
        self.moveDescriptionLabel.text = [self.game.history[historyItemIndex] description];
    }
}

- (void) updateUI {
    // test
    for (UIButton* button in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:button];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        [button setAttributedTitle:[self attributedTitleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        button.enabled = !card.matched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.gameModeSelection.enabled = !self.gameInProgress;
    
    self.moveDescriptionLabel.alpha = 1;
    self.moveDescriptionLabel.text = [[self.game.history lastObject] description];
    
    self.historySlider.maximumValue = [self.game.history count];
    self.historySlider.value = self.historySlider.maximumValue;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    self.gameInProgress = YES;
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)redeal:(id)sender {
    self.gameInProgress = NO;
    self.game = nil;
    [self updateUI];
}

- (NSAttributedString*)attributedTitleForCard:(Card*)card {
    return nil;
}

- (UIImage*)backgroundImageForCard:(Card*)card {
    return nil;
}

@end

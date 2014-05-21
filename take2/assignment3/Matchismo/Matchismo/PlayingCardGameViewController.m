//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/11/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck*) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (NSAttributedString*)attributedTitleForCard:(Card*)card {
    return [[NSAttributedString alloc] initWithString:card.isChosen ? card.contents : @""];
}

- (UIImage*)backgroundImageForCard:(Card*)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

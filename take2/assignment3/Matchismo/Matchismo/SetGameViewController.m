//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Nadav Greenberg on 5/11/14.
//  Copyright (c) 2014 Nadav Greenberg. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

- (Deck*) createDeck {
    return [[SetCardDeck alloc] init];
}

- (NSAttributedString*)attributedTitleForCard:(Card*)card {
    NSMutableAttributedString* content = [[NSMutableAttributedString alloc] init];
    NSString* shapeChar = @"?";
    SetCard* setCard = (SetCard*)card;
    if (setCard.shape == shape1) {
        shapeChar = @"■";
    } else if (setCard.shape == shape2) {
        shapeChar = @"▲";
    } else if (setCard.shape == shape3) {
        shapeChar = @"●";
    }
    
    NSString* countedShapes = shapeChar;
    if (setCard.number == 1) {
        countedShapes = shapeChar;
    } else if (setCard.number == 2) {
        countedShapes = [NSString stringWithFormat:@"%@%@", shapeChar, shapeChar];
    } else if (setCard.number == 3) {
        countedShapes = [NSString stringWithFormat:@"%@%@%@", shapeChar, shapeChar, shapeChar];
    }
    
    content = [[NSMutableAttributedString alloc] initWithString:countedShapes];
    
    UIColor* color = [UIColor redColor];
    if (setCard.color == color1) {
        color = [UIColor redColor];
    } else if (setCard.color == color2) {
        color = [UIColor blueColor];
    } else if (setCard.color == color3) {
        color = [UIColor greenColor];
    }
    
    NSRange range = [[content string] rangeOfString:countedShapes];
    
    // set color attribute
    [content addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    NSDictionary* shadeAttribute = @{};
    
    if (setCard.shade == shade1) {
        shadeAttribute = @{NSUnderlineStyleAttributeName : [[NSNumber alloc] initWithInt:NSUnderlineStyleSingle]};
    } else if (setCard.shade == shade2) {
        shadeAttribute = @{NSStrokeColorAttributeName : [UIColor brownColor],
                           NSStrokeWidthAttributeName : @5};
    } else if (setCard.shade == shade3) {
        shadeAttribute = @{NSUnderlineStyleAttributeName: [[NSNumber alloc] initWithInt:NSUnderlineStyleSingle]};
    }
    
    [content addAttributes:shadeAttribute range:range];
    
    return content;
}

- (UIImage*)backgroundImageForCard:(Card*)card {
    return [UIImage imageNamed:card.isChosen ? @"cardselected" : @"cardfront"];
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
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set is a Match-3 type of game
    self.gameMode = 3;
    [self updateUI];
    // Do any additional setup after loading the view.
}

/*
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

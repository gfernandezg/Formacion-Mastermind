//
//  ViewController.m
//  MasterMind
//
//  Created by Guillem Fernández González on 20/04/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#define unknownColor [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1]

#import "ViewController.h"

@interface ViewController ()

@property (readonly, nonatomic) NSInteger firstEmptyColor;

- (void)setNextColor:(UIColor *)newColor;
- (void)resetColors;
- (void)colorTaped:(id)sender;

- (void)checkCombination;
- (NSArray *)getCombination;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize empty colors
    [self resetColors];
    
    // Initialize gestures to remove colors
    for (int n=0; n<4; n++)
    {
        [[_testColors objectAtIndex:n] setUserInteractionEnabled:YES];
        [[_testColors objectAtIndex:n] addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(colorTaped:)]];
    }
    
}

- (NSInteger)firstEmptyColor
{
    if ([[[_testColors objectAtIndex:0] backgroundColor] isEqual:unknownColor])
        return 0;
    else if ([[[_testColors objectAtIndex:1] backgroundColor] isEqual:unknownColor])
        return 1;
    else if ([[[_testColors objectAtIndex:2] backgroundColor] isEqual:unknownColor])
        return 2;
    else if ([[[_testColors objectAtIndex:3] backgroundColor] isEqual:unknownColor])
        return 3;
    
    return -1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)resetColors
{
    for (int n=0; n<4; n++)
        [[_testColors objectAtIndex:n] setBackgroundColor:unknownColor];
}

- (void)setNextColor:(UIColor *)newColor
{
    if (self.firstEmptyColor >= 0)
        [[_testColors objectAtIndex:self.firstEmptyColor] setBackgroundColor:newColor];

}

- (IBAction)setColor:(id)sender {
    
    // Get the button that is sending the message
    UIButton *currentButton = (UIButton *)sender;
    
    // Get the color of the button
    UIColor *currentColor = currentButton.backgroundColor;
    
    // Set next emplty color to current color
    [self setNextColor:currentColor];
    
    // Check if combination is complete and send it
    if (self.firstEmptyColor<0)
    {
        [self checkCombination];
        [self resetColors];
    }
}

- (void)colorTaped:(UITapGestureRecognizer *)tapGesture
{
    UILabel *tapedLabel = (UILabel *)tapGesture.view;

    [tapedLabel setBackgroundColor:unknownColor];
}


- (void)checkCombination
{
    // Add combination to grid
    NSMutableArray *currentGridArray = [_results.values mutableCopy];
    
    // If values are not created create it
    if (!currentGridArray) {
        currentGridArray = [NSMutableArray array];
    }
    
    // Get the array corresponding to the combination
    NSArray *newCombination = [self getCombination];
    
    // Add combinaion to values
    [currentGridArray addObject:newCombination];
    _results.values = [NSArray arrayWithArray:currentGridArray];
    
}

- (NSArray *)getCombination
{
    NSMutableArray *combination = [NSMutableArray arrayWithCapacity:4];
    BOOL valueSet;
    
    // Traverse all colors and compare with button colors to set values
    for (int n=0; n<4; n++) {
        valueSet = NO;
        for (int m=0; m<4; m++) {
            if ([[[_testColors objectAtIndex:n] backgroundColor] isEqual:[[_buttonColors objectAtIndex:m] backgroundColor]]) {
                [combination insertObject:[NSNumber numberWithInt:m+1] atIndex:n];
                valueSet = YES;
                break;
            }
        }
        if (!valueSet)
            [combination replaceObjectAtIndex:n withObject:[NSNumber numberWithInt:0]];
    }
    
    return [NSArray arrayWithArray:combination];
}

@end

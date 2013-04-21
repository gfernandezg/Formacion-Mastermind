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
}

- (void)colorTaped:(UITapGestureRecognizer *)tapGesture
{
    UILabel *tapedLabel = (UILabel *)tapGesture.view;

    [tapedLabel setBackgroundColor:unknownColor];
}

@end

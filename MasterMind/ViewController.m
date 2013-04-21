//
//  ViewController.m
//  MasterMind
//
//  Created by Guillem Fernández González on 20/04/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *testValues = [NSArray arrayWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:1],
                                                     [NSNumber numberWithInt:2],
                                                     [NSNumber numberWithInt:3],
                                                     [NSNumber numberWithInt:4],nil],
                           [NSArray arrayWithObjects:[NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:1],
                            [NSNumber numberWithInt:1],nil], nil];
    
    _results.values = testValues;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.h
//  MasterMind
//
//  Created by Guillem Fernández González on 20/04/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet GridView *results;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *testColors;

- (IBAction)setColor:(id)sender;
@end

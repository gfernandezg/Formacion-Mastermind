//
//  GridView.m
//  MasterMind
//
//  Created by Guillem Fernández González on 20/04/13.
//  Copyright (c) 2013 Guillem Fernández González. All rights reserved.
//

#import "GridView.h"

@implementation GridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Prepare measures
    float cellMargin = 2.0f;
    
    float width = rect.size.width - 2*cellMargin ;
    float height = rect.size.height - 2*cellMargin;
    
    int columns = 4;
    int rows = 10;
    
    float colWidth  = width/4;
    float rowHeight = height/10;
    
    
    // Prepare the context
    CGContextRef context = UIGraphicsGetCurrentContext();

    int colorValue;
    
    // Create our drawing path
    for (int y=0; y<rows; y++) {
        for (int x=0; x<columns; x++) {
            
            if ([_values count]<=y) {
                colorValue = 0;
            } else {
                if ([[_values objectAtIndex:y] count]<=x) {
                    colorValue = 0;
                } else {
                    colorValue = [(NSNumber *)[[_values objectAtIndex:y] objectAtIndex:x] intValue];
                }
            }
            
            switch (colorValue) {
                case 0:
                    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.05);
                    break;
                case 1:
                    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
                    break;
                case 2:
                    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
                    break;
                case 3:
                    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
                    break;
                case 4:
                    CGContextSetRGBFillColor(context, 1.0, 0.98, 0.0, 1.0);
                    break;
                default:
                    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.25);
                    break;
            }
            

            CGContextFillRect(context, CGRectMake((x*colWidth)+cellMargin, (y*rowHeight)+cellMargin, colWidth-(2*cellMargin), rowHeight-(2*cellMargin)));
        }
    }
    
}

- (void)setValues:(NSArray *)values
{
    if (_values != values) {
        _values = values;
        [self setNeedsDisplay];
    }
}

@end

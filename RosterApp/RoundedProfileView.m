//
//  RoundedProfileView.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/15/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "RoundedProfileView.h"

@implementation RoundedProfileView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGRect bounds = self.bounds;
    
    CGColorRef aColor;
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
}


@end

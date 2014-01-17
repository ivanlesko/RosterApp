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
        self.layer.cornerRadius = frame.size.width / 2.0;
        self.layer.masksToBounds = YES;
        
        self.profileImageView = [[UIImageView alloc] initWithFrame:frame];
        self.profileImageView.backgroundColor = [UIColor lightGrayColor];
        self.profileImageView.image = [UIImage imageNamed:@"emptyProfile.png"];
        self.profileImageView.layer.cornerRadius = frame.size.width / 2.0;
        
        [self addSubview:self.profileImageView];
    }
    return self;
}


/**
 *
- (void)drawRect:(CGRect)rect
{

}
 *
*/

@end

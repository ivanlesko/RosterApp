//
//  CodeFellowUITableViewCell.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/16/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "CodeFellowUITableViewCell.h"

@implementation CodeFellowUITableViewCell

- (id)init
{
    self = [super init];
    if (self) {

    }
    
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageView.layer.masksToBounds = YES;
        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2.0;
        
        self.imageView.frame = CGRectMake(self.imageView.frame.origin.x,
                                          self.imageView.frame.origin.y,
                                          self.imageView.bounds.size.width * 0.8,
                                          self.imageView.bounds.size.height * 0.8);
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNameLabel:(UILabel *)nameLabel
{
    NSLog(@"setting name label");
}

@end








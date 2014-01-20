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

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCodeFellow:(CodeFellow *)codeFellow
{
    self.textLabel.text = codeFellow.name;
    self.imageView.image = codeFellow.profileImage;
    
    if (!self.imageView.image) {
        self.imageView.image = [UIImage imageNamed:@"emptyProfile.png"];
        self.imageView.layer.cornerRadius = 10.0f;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.layer.masksToBounds = YES;
    
    self.imageView.bounds = CGRectMake(0,
                                       0,
                                       self.imageView.bounds.size.width  * 0.9,
                                       self.imageView.bounds.size.height * 0.9);
    
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width / 2.0;
}

@end








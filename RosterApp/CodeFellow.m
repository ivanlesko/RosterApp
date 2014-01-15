//
//  CodeFellow.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "CodeFellow.h"

@implementation CodeFellow

- (id)init
{
    self = [super init];
    if (self) {
        self.name     = @"Missing Name";
        self.category = @"Missing Category";
        self.github   = @"Missing Github";
        self.twitter  = @"Missing Twitter";
    }
    
    return self;
}


- (id)initWithName:(NSString *)theName
       andCategory:(NSString *)theCategory
         andGithub:(NSString *)theGithub
        andTwitter:(NSString *)theTwitter;
{
    self = [super init];
    if (self) {
        self.name     = theName;
        self.category = theCategory;
        self.github   = theGithub;
        self.twitter  = theTwitter;
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

- (NSString *)description
{
    NSString *descriptionString;
    descriptionString = [NSString stringWithFormat:@"%@ is a %@. Twitter: %@, Github: %@",
                         self.name,
                         self.category,
                         self.twitter,
                         self.github];
    
    return descriptionString;
}

@end












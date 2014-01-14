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
        self.firstName = @"First";
        self.lastName  = @"Last";
        self.category  = @"Category";
    }
    
    return self;
}


- (id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andCategory:(NSString *)category
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName  = lastName;
        self.category  = category;
    }
    
    return self;
}

@end

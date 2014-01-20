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
        // Dummy Checks
        self.name     = @"Missing Name";
        self.category = @"Missing Category";
        self.github   = @"@";
        self.twitter  = @"@";

        self.profileImagePath = nil;
        self.profileImage = nil;
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
        self.profileImagePath = [[self docsDirPath] stringByAppendingFormat:@"%@_profilePic.png", self.name];
        self.profileImage = [UIImage imageWithContentsOfFile:self.profileImagePath];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.category = [aDecoder decodeObjectForKey:@"category"];
    self.github   = [aDecoder decodeObjectForKey:@"github"];
    self.twitter  = [aDecoder decodeObjectForKey:@"twitter"];
    self.profileImagePath = [aDecoder decodeObjectForKey:@"profileImagePath"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.category forKey:@"category"];
    [aCoder encodeObject:self.github forKey:@"github"];
    [aCoder encodeObject:self.twitter forKey:@"twitter"];
    [aCoder encodeObject:self.profileImagePath forKey:@"profileImagePath"];
}

- (NSString *)description
{
    NSString *descriptionString;
    descriptionString = [NSString stringWithFormat:@"\n%@ is a %@. \nTwitter: %@, Github: %@\nImage: %@",
                         self.name,
                         self.category,
                         self.twitter,
                         self.github,
                         self.profileImage];
    
    return descriptionString;
}

- (NSString *)docsDirPath
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [searchPaths lastObject];
    NSString *documentsPath = [documentsDirectory stringByAppendingString:@"/"];
    
    return documentsPath;
}

@end












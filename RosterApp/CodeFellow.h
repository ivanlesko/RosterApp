//
//  CodeFellow.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeFellow : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *category;

@property (nonatomic, strong) NSString *randomFact;

/** This is the designated initializer */
- (id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andCategory:(NSString *)category;

@end

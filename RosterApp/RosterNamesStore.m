//
//  RosterNamesStore.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "RosterNamesStore.h"

@implementation RosterNamesStore

- (id)init
{
    self = [super init];
    if (self) {
        
        [self populateCodeFellowsStore];
    }
    
    return self;
}

+ (RosterNamesStore *)rosterNamesStore
{
    static RosterNamesStore *rosterNamesStore = nil;
    if (!rosterNamesStore) {
        rosterNamesStore = [[super allocWithZone:nil] init];
    }
    
    return rosterNamesStore;
}

- (NSMutableArray *)codeFellowStudents
{
    return codeFellowStudents;
}

- (NSMutableArray *)codeFellowTeachers
{
    return codeFellowTeachers;
}

- (void)addCodeFellowStudent:(CodeFellow *)theCodeFellow
{
    [codeFellowStudents addObject:theCodeFellow];
}

- (void)addCodeFellowTeacher:(CodeFellow *)theCodeFellow
{
    [codeFellowTeachers addObject:theCodeFellow];
}

- (void)populateCodeFellowsStore
{
    /** These are the current CodeFellow iOS Students **/
    CodeFellow *nicholasBernard = [[CodeFellow alloc] initWithFirstName:@"Nicholas" andLastName:@"Bernard" andCategory:@"Student"];
    CodeFellow *zuriBiringer    = [[CodeFellow alloc] initWithFirstName:@"Zuri" andLastName:@"Biringer" andCategory:@"Student"];
    CodeFellow *chadColby       = [[CodeFellow alloc] initWithFirstName:@"Chad" andLastName:@"Colby" andCategory:@"Student"];
    CodeFellow *spencerFornaciari = [[CodeFellow alloc] initWithFirstName:@"Spencer" andLastName:@"Fornaciari" andCategory:@"Student"];
    CodeFellow *raghavHaran     = [[CodeFellow alloc] initWithFirstName:@"Raghav" andLastName:@"Haran" andCategory:@"Student"];
    CodeFellow *timothyHise     = [[CodeFellow alloc] initWithFirstName:@"Timothy" andLastName:@"Hise" andCategory:@"Student"];
    CodeFellow *ivanLesko       = [[CodeFellow alloc] initWithFirstName:@"Ivan" andLastName:@"Lesko" andCategory:@"Student"];
    CodeFellow *richardLichkus  = [[CodeFellow alloc] initWithFirstName:@"Richard" andLastName:@"Lichkus" andCategory:@"Student"];
    CodeFellow *bennetBennett   = [[CodeFellow alloc] initWithFirstName:@"Bennett Lin" andLastName:@"Bennett" andCategory:@"Student"];
    CodeFellow *christopherMeehan = [[CodeFellow alloc] initWithFirstName:@"Christopher" andLastName:@"Meehan" andCategory:@"Student"];
    CodeFellow *mattRemick      = [[CodeFellow alloc] initWithFirstName:@"Matt" andLastName:@"Remick" andCategory:@"Student"];
    CodeFellow *andrewRodgers   = [[CodeFellow alloc] initWithFirstName:@"Andrew" andLastName:@"Rodgers" andCategory:@"Student"];
    CodeFellow *jeffSchwab      = [[CodeFellow alloc] initWithFirstName:@"Jeff" andLastName:@"Schwab" andCategory:@"Student"];
    CodeFellow *stevenStevenson = [[CodeFellow alloc] initWithFirstName:@"Steven" andLastName:@"Stevenson" andCategory:@"Student"];
    CodeFellow *yairSzarf       = [[CodeFellow alloc] initWithFirstName:@"Yair" andLastName:@"Szarf" andCategory:@"Student"];
    
    codeFellowStudents = [NSMutableArray arrayWithObjects:
                                                       nicholasBernard,
                                                       zuriBiringer,
                                                       chadColby,
                                                       spencerFornaciari,
                                                       raghavHaran,
                                                       timothyHise,
                                                       ivanLesko,
                                                       richardLichkus,
                                                       bennetBennett,
                                                       christopherMeehan,
                                                       mattRemick,
                                                       andrewRodgers,
                                                       jeffSchwab,
                                                       stevenStevenson,
                                                       yairSzarf,
                                                       nil];
    
    /** These are the current CodeFellow iOS Teachers **/
    CodeFellow *ivanStorck      = [[CodeFellow alloc] initWithFirstName:@"Ivan" andLastName:@"Storck" andCategory:@"Teacher"];
    CodeFellow *johnClem        = [[CodeFellow alloc] initWithFirstName:@"John" andLastName:@"Clem" andCategory:@"Teacher"];
    CodeFellow *bradJohnson     = [[CodeFellow alloc] initWithFirstName:@"Brad" andLastName:@"Johnson" andCategory:@"Teacher"];
    
    codeFellowTeachers = [NSMutableArray arrayWithObjects:
                          ivanStorck,
                          johnClem,
                          bradJohnson,
                          nil];
}



@end


















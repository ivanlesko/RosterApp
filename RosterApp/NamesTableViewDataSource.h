//
//  NamesTableViewDataSource.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/14/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CodeFellow.h"
#import "RosterNamesStore.h"

/**
 * NamesTableViewDataSource adopts to the UITableViewDataSource protocol.
 * It is The roster name's table view data source. 
 */

@interface NamesTableViewDataSource : NSObject <UITableViewDataSource>

@property RosterNamesStore *nameStore;

@end

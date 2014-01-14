//
//  ViewController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RosterNamesStore.h"
#import "CodeFellowDetailViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *namesTableView;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

//
//  ViewController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelController.h"
#import "CodeFellowDetailViewController.h"
#import "CodeFellowUITableViewCell.h"

@interface ViewController : UIViewController <UITableViewDelegate, UIActionSheetDelegate, DetailViewControllerDelegate>

@property (nonatomic) ModelController *nameStore;

@property (weak, nonatomic) IBOutlet UITableView *namesTableView;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (nonatomic, strong) UIActionSheet *sortActionSheet;

- (IBAction)sortTable:(id)sender;

@end

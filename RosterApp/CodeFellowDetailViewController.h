//
//  CodeFellowDetailViewController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CodeFellow.h"

/**
 * This view controller controls the detail page
 * when a code fellow is clicked on the 
 * names table view
 */
@interface CodeFellowDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) CodeFellow *theCodeFellow;

@end

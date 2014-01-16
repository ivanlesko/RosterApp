//
//  CodeFellowDetailViewController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CodeFellow.h"
#import "RoundedProfileView.h"

@import AssetsLibrary;

@protocol DetailViewControllerDelegate <NSObject>

- (void)updatedCodeFellowInfo:(CodeFellow *)theCodeFellow;

@end

/**
 * This view controller controls the detail page
 * when a code fellow is clicked on the 
 * names table view
 */
@interface CodeFellowDetailViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) CodeFellow *theCodeFellow;
@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (nonatomic) RoundedProfileView *profileView;

@property id delegate;

- (IBAction)addProfilePic:(id)sender;


@end

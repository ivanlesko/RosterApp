//
//  CodeFellowDetailViewController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CodeFellow.h"

@import AssetsLibrary;

@protocol DetailViewControllerDelegate <NSObject>

- (void)updatedCodeFellowInfo:(CodeFellow *)theCodeFellow;
- (void)saveData;

@end

/**
 * This view controller controls the detail page
 * when a code fellow is clicked on the 
 * names table view
 */
@interface CodeFellowDetailViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) CodeFellow *theCodeFellow;

@property (strong, nonatomic) IBOutlet UINavigationItem *navItem;

@property (strong, nonatomic) UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UIImageView *twitterImageView;
@property (weak, nonatomic) IBOutlet UITextField *twitterTextField;
@property (weak, nonatomic) IBOutlet UIView *twitterTextFieldBackgroundView;

@property (weak, nonatomic) IBOutlet UIImageView *githubImageView;
@property (weak, nonatomic) IBOutlet UITextField *githubTextField;
@property (weak, nonatomic) IBOutlet UIView *githubTextfieldBackgroundView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *nameBackgroundView;

@property id delegate;

- (void)addProfilePic;
- (void)saveImageToCodeFellow:(UIImage *)theImage;

@end

//
//  AddNewCodeFellowViewController.h
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewCodeFellowViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *codeFellowsCategories;
    
    NSInteger currentPickerIndex;
}

- (IBAction)closeController:(id)sender;
- (IBAction)saveNewCodeFellow:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *firstNameField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameField;

@property (strong, nonatomic) IBOutlet UIPickerView *categoryPicker;


@end

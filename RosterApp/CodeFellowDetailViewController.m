//
//  CodeFellowDetailViewController.m
//  RosterApp
//
//  Created by Ivan Lesko on 1/13/14.
//  Copyright (c) 2014 Ivan Lesko. All rights reserved.
//

#import "CodeFellowDetailViewController.h"

@interface CodeFellowDetailViewController ()

@end

@implementation CodeFellowDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.profileView.layer.masksToBounds = YES;
    self.profileView.layer.cornerRadius = self.profileView.bounds.size.width / 2.0;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navItem.title = [NSString stringWithFormat:@"%@", self.theCodeFellow.name];
    
    if (self.theCodeFellow.profileImage) {
        self.profileView.profileImage = self.theCodeFellow.profileImage;
        self.profileView.layer.cornerRadius = self.profileView.bounds.size.width / 2.0;
        
        self.addButton.enabled = NO;
        [self.addButton setTitle:@"" forState:UIControlStateNormal];
    }
    
    self.profileView = [[RoundedProfileView alloc] initWithFrame:CGRectMake(self.addButton.frame.origin.x,
                                                                            self.addButton.frame.origin.y,
                                                                            200,
                                                                            200)];
    
    [self.view insertSubview:self.profileView atIndex:0];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.delegate updatedCodeFellowInfo:self.theCodeFellow];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action Sheet Methods

- (IBAction)addProfilePic:(id)sender
{
    UIActionSheet *sheet;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sheet = [[UIActionSheet alloc] initWithTitle:@"Select Photo From:"
                                            delegate:self
                                   cancelButtonTitle:@"Cancel"
                              destructiveButtonTitle:nil
                                   otherButtonTitles:@"Camera", @"Photo Library", nil];
    } else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"Select Photo From:"
                                            delegate:self
                                   cancelButtonTitle:@"Cancel"
                              destructiveButtonTitle:nil
                                   otherButtonTitles:@"Photo Library", nil];
    }
    
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Camera"]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        self.profileView.layer.cornerRadius = self.profileView.bounds.size.width / 2.0;
        self.profileView.layer.masksToBounds = YES;
        self.profileView.profileImage = editedImage;
        self.theCodeFellow.profileImage = editedImage;
        
        self.addButton.enabled = NO;
        [self.addButton setTitle:@"" forState:UIControlStateNormal];
        
        // If the app does not have permission to access the photo library
        if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusDenied || [ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusRestricted) {
            NSLog(@"cannot access photo library");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Access Denied!"
                                                            message:@"This app does not have permission to access your photo library"
                                                           delegate:self
                                                  cancelButtonTitle:@"Okay"
                                                  otherButtonTitles:nil, nil];
            
            [alert show];
            [picker dismissViewControllerAnimated:YES completion:^{
                // Implement anything else after the user has dismissed the alert.
            }];
        } else {
            // If the app DOES have access to the photo library
            NSData *photoData = UIImagePNGRepresentation(editedImage);
            NSString *studentPNGsavePath = [NSString stringWithFormat:@"%@_profile.png", self.theCodeFellow.name];
            NSString *PNGSavePath = [[self docsDirPath] stringByAppendingString:studentPNGsavePath];
            [photoData writeToFile:PNGSavePath atomically:YES];
        }
        
    }];
}

#pragma mark - Documents Directory

- (NSString *)docsDirPath
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths lastObject];
    
    return documentPath;
}



@end

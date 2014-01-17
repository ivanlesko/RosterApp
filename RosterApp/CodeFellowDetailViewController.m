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
    

    self.profileImageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.profileImageView.layer.shadowOffset = CGSizeMake(0, 3);
    self.profileImageView.layer.shadowRadius = 0;
    self.profileImageView.layer.shadowOpacity = 0.3f;
    
    self.nameBackgroundView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.nameBackgroundView.layer.shadowOffset = CGSizeMake(0, 3);
    self.nameBackgroundView.layer.shadowRadius = 0;
    self.nameBackgroundView.layer.shadowOpacity = 0.3f;
    
    [self.view addSubview:self.profileImageView];
    
    // Implement the add profile picture button
    self.addButton = [[UIButton alloc] initWithFrame:CGRectMake(self.profileImageView.frame.origin.x,
                                                                self.profileImageView.frame.origin.y,
                                                                self.profileImageView.frame.size.width,
                                                                self.profileImageView.frame.size.height - self.profileImageView.frame.size.height * 0.4f)];
    self.addButton.backgroundColor = [UIColor clearColor];
    self.addButton.titleLabel.textColor = [UIColor whiteColor];
    self.addButton.titleLabel.font = [UIFont systemFontOfSize:100];
    [self.addButton setTitle:@"+" forState:UIControlStateNormal];
    
    [self.addButton addTarget:self
                       action:@selector(addProfilePic)
             forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.addButton];
    
    self.nameLabel.text = self.theCodeFellow.name;
    
    NSLog(@"%@", self.navigationController);
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navItem.title = [NSString stringWithFormat:@"%@", self.theCodeFellow.name];
    
    // If the Code Fellow DOES have a profile image..
    if (!self.theCodeFellow.profileImage) {
        self.profileImageView.image = [UIImage imageNamed:@"emptyProfile.png"];
    } else {
        self.profileImageView.image = self.theCodeFellow.profileImage;
        [self.addButton setTitle:@"" forState:UIControlStateNormal];
        self.addButton.enabled = NO;
    }
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

- (void)addProfilePic
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
    } else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Cancel"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        self.profileImageView.image = editedImage;
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
            
            [self saveImageToCodeFellow:editedImage];
        }
    }];
}

- (void)saveImageToCodeFellow:(UIImage *)theImage
{
    NSData *photoData = UIImagePNGRepresentation(theImage);
    NSString *studentPNGsavePath = [NSString stringWithFormat:@"%@_profilePic.png", self.theCodeFellow.name];
    self.theCodeFellow.profileImagePath = studentPNGsavePath;
    self.theCodeFellow.profileImage = theImage;
    NSString *PNGSavePath = [[self docsDirPath] stringByAppendingString:studentPNGsavePath];
    [photoData writeToFile:PNGSavePath atomically:YES];
    
    NSLog(@"Saved to: %@", PNGSavePath);
}

#pragma mark - Documents Directory

- (NSString *)docsDirPath
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [searchPaths lastObject];
    NSString *documentsPath = [documentsDirectory stringByAppendingString:@"/"];
    
    return documentsPath;
}



@end

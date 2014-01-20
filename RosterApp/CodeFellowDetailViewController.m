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
    
    self.twitterTextField.delegate = self;
    self.githubTextField.delegate = self;
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
    
    self.theCodeFellow.twitter = self.twitterTextField.text;
    
    NSString *githubURL = [NSString stringWithFormat:@"http://www.github.com/%@", self.githubTextField.text];
    self.theCodeFellow.github  = githubURL;
    
    [self.delegate updatedCodeFellowInfo:self.theCodeFellow];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
        [self presentViewController:imagePicker animated:YES completion:nil];
    } else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Cancel"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
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
    self.theCodeFellow.profileImagePath = studentPNGsavePath;
    NSString *PNGSavePath = [[self docsDirPath] stringByAppendingString:studentPNGsavePath];
    [photoData writeToFile:PNGSavePath atomically:YES];
    
    NSLog(@"Saved to: %@", PNGSavePath);
    
    [self.delegate saveData];
}

#pragma mark - Documents Directory

- (NSString *)docsDirPath
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [searchPaths lastObject];
    NSString *documentsPath = [documentsDirectory stringByAppendingString:@"/"];
    
    return documentsPath;
}

- (void) addDropShadowToLayer:(CALayer *)theLayer withShadowSize:(CGFloat)floatSize
{
    theLayer.shadowColor = [[UIColor blackColor] CGColor];
    theLayer.shadowOffset = CGSizeMake(0, floatSize);
    theLayer.shadowRadius = 0;
    theLayer.shadowOpacity = 0.3f;
}

- (UIImage *)applyBlurOnImage: (UIImage *)imageToBlur
                   withRadius: (CGFloat)blurRadius {
    
    CIImage *originalImage = [CIImage imageWithCGImage: imageToBlur.CGImage];
    CIFilter *filter = [CIFilter filterWithName: @"CIGaussianBlur"
                                  keysAndValues: kCIInputImageKey, originalImage,
                        @"inputRadius", @(blurRadius), nil];
    
    CIImage *outputImage = filter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    
    CGImageRef outImage = [context createCGImage: outputImage
                                        fromRect: [outputImage extent]];
    return [UIImage imageWithCGImage: outImage];
}

#pragma mark - Text Field Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textField: %@", textField);
    
    return YES;
}

@end











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
    
    self.descriptionLabel.shadowColor = [UIColor blackColor];
    self.descriptionLabel.shadowOffset = CGSizeMake(1, 1);
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.descriptionLabel.text = [NSString stringWithFormat:@"%@", self.theCodeFellow.name];
    
    self.navItem.title = [NSString stringWithFormat:@"%@", self.theCodeFellow.name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

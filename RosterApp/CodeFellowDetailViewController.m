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
}

- (void)viewWillAppear:(BOOL)animated
{
    self.descriptionLabel.text = [NSString stringWithFormat:@"%@ %@ is a Code Fellows %@!", self.theCodeFellow.firstName, self.theCodeFellow.lastName, self.theCodeFellow.category];
    
    self.navItem.title = [NSString stringWithFormat:@"%@ %@", self.theCodeFellow.firstName, self.theCodeFellow.lastName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

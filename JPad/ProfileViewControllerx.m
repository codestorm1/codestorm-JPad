//
//  ProfileViewController.m
//  JPad
//
//  Created by Bryan Green on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewControllerBad.h"


@implementation ProfileViewControllerBad

@synthesize miniProfile;
@synthesize profileImage;
@synthesize username;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
        [profileImage setImage:miniProfile.image];
    //    [profileImage setFrame:CGRectMake(10, 10, 100, 100)];
    //    [username setText:[miniProfile username]];    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end

//
//  ProfileViewController.m
//  JPad
//
//  Created by Bryan Green on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"


@implementation ProfileViewController

@synthesize miniProfile;
@synthesize profileImage;
@synthesize username;
@synthesize ageAndLocation;
@synthesize genderAndSeeking;
@synthesize lastLoggedIn;

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
-(void)refreshTheView {
    [profileImage setImage:miniProfile.thumbnailImage];
//    CGRect rect = [profileImage frame];
//    [profileImage setFrame:CGRectMake(20, 20, 250, 300)];
    [username setText:[miniProfile username]];
    NSString *ageLocation = [[NSString alloc] initWithFormat:@"%@, %@", [self.miniProfile age], [self.miniProfile location]];
    [ageAndLocation setText:ageLocation];
    [ageLocation release];

    NSString *genderSeeking = [[NSString alloc] initWithFormat:@"%@ seeking a %@", [self.miniProfile gender], [self.miniProfile seekingGender ]];
    [genderAndSeeking setText:genderSeeking];
    [genderSeeking release];
    
//    NSString *displayString = [NSDate stringForDisplayFromDate:[miniProfile lastLoggedIn]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EE MMMM d, YYYY"];
    NSString *dateString = [dateFormat stringFromDate:[miniProfile lastLoggedIn]];  
    [dateFormat release];
    
    [lastLoggedIn setText:dateString];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

//
//  ProfileViewController.h
//  JPad
//
//  Created by Bryan Green on 7/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiniProfile.h"


@interface ProfileViewController : UIViewController {
    MiniProfile *miniProfile;
    UIImageView *profileImage;
    UILabel *username;
    UILabel *ageAndLocation;
    UILabel *genderAndSeeking;
    UILabel *lastLoggedIn;
}

-(void)refreshTheView;

@property (nonatomic, retain) MiniProfile *miniProfile;
@property (nonatomic, retain) IBOutlet UIImageView *profileImage;
@property (nonatomic, retain) IBOutlet UILabel *username;
@property (nonatomic, retain) IBOutlet UILabel *ageAndLocation;
@property (nonatomic, retain) IBOutlet UILabel *genderAndSeeking;
@property (nonatomic, retain) IBOutlet UILabel *lastLoggedIn;


@end

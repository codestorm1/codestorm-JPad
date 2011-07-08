//
//  JPadAppDelegate.h
//  JPad
//
//  Created by Bryan Green on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberListTableViewController.h"

@interface JPadAppDelegate : NSObject <UIApplicationDelegate> {

    MemberListTableViewController *memberListTableViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MemberListTableViewController *memberListTableViewController;

@end

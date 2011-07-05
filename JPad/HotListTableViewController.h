//
//  HotListViewController.h
//  JPad
//
//  Created by Bryan Green on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MemberList.h"


@interface HotListTableViewController : UITableViewController {

    MemberList *hotListMembers;
}

-(void)dataFetchHasCompleted;

@property (nonatomic, retain) MemberList *hotListMembers;
@end

//
//  ListBaseViewController.h
//  JPad
//
//  Created by Bryan Green on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataFetcher.h"
#import "ListBase.h"
#import "ProfileViewController.h"

@interface ListBaseViewController : UITableViewController {

    ListBase *itemList;
    @protected NSString *resourceUrl;
    @protected DataFetcher *dataFetcher;
    ProfileViewController *profileViewController;
        
}
    
-(void)dataFetchHasCompleted;

    
@property (nonatomic, retain) ListBase *itemList;
@property (nonatomic, retain) NSString *resourceUrl;
@property (nonatomic, retain) DataFetcher *dataFetcher;
@property (nonatomic, retain) ProfileViewController *profileViewController;

@end
    
    
    

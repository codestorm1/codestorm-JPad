//
//  HotListViewController.h
//  JPad
//
//  Created by Bryan Green on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotList.h"
#import "DataFetcher.h"

@interface HotListViewController : UITableViewController {
    
    HotList *members;
    @private NSString *resourceUrl;
    @private DataFetcher *dataFetcher;
    
}

-(void)dataFetchHasCompleted;
-(void)setResourceUrl:(NSString *)newResourceUrl;

@property (nonatomic, retain) HotList *members;
@property (nonatomic, retain) NSString *resourceUrl;
@property (nonatomic, retain) DataFetcher *dataFetcher;

@end

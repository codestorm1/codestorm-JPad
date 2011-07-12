//
//  HotListEntry.m
//  JPad
//
//  Created by Bryan Green on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HotListEntry.h"


@implementation HotListEntry

@synthesize actionDate;
@synthesize hotListCategory;
@synthesize miniProfile;

-(void)Deserialize: (NSObject *)obj {
    
    NSDictionary *memberData = (NSDictionary *)obj;
    //self.actionDate = (NSDate *)[memberData objectForKey:@"actionDate"];
    self.hotListCategory =      [memberData objectForKey:@"category"];
    self.miniProfile = [[MiniProfile alloc] init];
    [miniProfile Deserialize:[memberData objectForKey:@"miniProfile"]];
}

-(void) dealloc {
    [miniProfile release];
    [super dealloc];
}

@end

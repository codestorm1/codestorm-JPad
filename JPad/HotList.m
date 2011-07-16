//
//  MemberList.m
//  JPad
//
//  Created by Bryan Green on 7/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HotList.h"
#import "MiniProfile.h"
#import "HotListEntry.h"


@implementation HotList

//@synthesize items;

-(void)Deserialize: (NSObject *)obj {
    
    NSArray *entries = (NSArray *)obj;
    items = [[NSMutableArray alloc] init];
    HotListEntry *hotListEntry;
    if (entries != nil) {
        for (id entry in entries) {
            hotListEntry = [[HotListEntry alloc] init];
            [hotListEntry Deserialize:entry];
            [items addObject:hotListEntry];
            [hotListEntry release];
        }
    }
}
@end

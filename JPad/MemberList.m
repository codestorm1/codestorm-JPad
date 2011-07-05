//
//  MemberList.m
//  JPad
//
//  Created by Bryan Green on 7/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MemberList.h"
#import "MiniProfile.h"


@implementation MemberList

@synthesize memberArray;

-(void)Deserialize: (NSDictionary *)dict {

    memberArray = [[NSMutableArray alloc] init];
    NSArray *memberDict = [dict objectForKey:@"members"];
    MiniProfile *miniProfile;
    if (memberDict != nil) {
        for (id memberData in memberDict) {
            miniProfile = [[MiniProfile alloc] init];
            [miniProfile Deserialize:memberData];
            [memberArray addObject:miniProfile];
            [miniProfile release];
        }
    }
}
@end

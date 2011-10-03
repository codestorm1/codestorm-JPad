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

-(void)Deserialize: (NSObject *)obj {

    NSDictionary *dict = (NSDictionary *)obj;
    items = [[NSMutableArray alloc] init];
    NSArray *memberDict = [dict objectForKey:@"Members"];
    MiniProfile *miniProfile;
    if (memberDict != nil) {
        for (id memberData in memberDict) {
            miniProfile = [[MiniProfile alloc] init];
            [miniProfile Deserialize:memberData];
            [items addObject:miniProfile];
            [miniProfile release];
        }
    }
}
@end

//
//  HotListEntry.h
//  JPad
//
//  Created by Bryan Green on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializeProtocol.h"
#import "MiniProfile.h"

@interface HotListEntry : NSObject <SerializeProtocol> {
   
    NSDate *actionDate;
    NSString *hotListCategory; // this doesn't belong here, change the API
    MiniProfile *miniProfile;
}

@property (nonatomic, retain) NSDate *actionDate;
@property (nonatomic, retain) NSString *hotListCategory;
@property (nonatomic, retain) MiniProfile *miniProfile;

@end

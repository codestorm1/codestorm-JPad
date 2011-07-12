//
//  MemberList.h
//  JPad
//
//  Created by Bryan Green on 7/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializeProtocol.h"

@interface HotList : NSObject <SerializeProtocol> {
    
    NSMutableArray *hotListEntries;
}
@property (nonatomic, retain) NSMutableArray *hotListEntries;

@end

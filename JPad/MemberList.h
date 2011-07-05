//
//  MemberList.h
//  JPad
//
//  Created by Bryan Green on 7/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializeProtocol.h"

@interface MemberList : NSObject <SerializeProtocol> {
    
    NSMutableArray *memberArray;
}
@property (nonatomic, retain) NSMutableArray *memberArray;

@end

//
//  ListBase.h
//  JPad
//
//  Created by Bryan Green on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializeProtocol.h"


@interface ListBase : NSObject <SerializeProtocol> {
    
    NSMutableArray *items;
}

@property (nonatomic, retain) NSMutableArray *items;

@end

//
//  ListBase.m
//  JPad
//
//  Created by Bryan Green on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ListBase.h"


@implementation ListBase

@synthesize items;

-(void)Deserialize: (NSObject *)obj {
    [NSException raise:@"base class Deserialize method called" format:@"derived class must be called instead", ""];
}

@end

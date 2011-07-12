//
//  Feature.m
//  JPad
//
//  Created by Bryan Green on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Feature.h"


@implementation Feature

@synthesize name;
@synthesize description;
@synthesize resourceUrl;

-(id) initWithData:(NSString *)newName description:(NSString *)newDescription resourceUrl:(NSString *)newResourceUrl {
    [self init];
    self.name = newName;
    self.description = newDescription;
    self.resourceUrl = newResourceUrl;
    return self;
}
@end

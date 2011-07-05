//
//  SerializeProtocol.h
//  JPad
//
//  Created by Bryan Green on 7/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SerializeProtocol <NSObject>

-(void)Deserialize: (NSDictionary *)dict;

@end

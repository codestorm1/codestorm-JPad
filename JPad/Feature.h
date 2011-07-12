//
//  Feature.h
//  JPad
//
//  Created by Bryan Green on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Feature : NSObject {
    
    NSString *name;
    NSString *description;
    NSString *resourceUrl;
}

-(id) initWithData:(NSString *)newName description:(NSString *)newDescription resourceUrl:(NSString *)newResourceUrl;
@property(nonatomic, retain) NSString *name; 
@property(nonatomic, retain) NSString *description; 
@property(nonatomic, retain) NSString *resourceUrl; 

@end


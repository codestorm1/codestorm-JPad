//
//  DataFetcher.h
//  JPad
//
//  Created by Bryan Green on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializeProtocol.h"

@class SBJsonStreamParser;
@class SBJsonStreamParserAdapter;

@interface DataFetcher : NSObject {

    NSURLConnection *theConnection;
    SBJsonStreamParser *parser;
    SBJsonStreamParserAdapter *adapter;
    NSObject <SerializeProtocol> *targetObject;
    NSObject *callbackObject;
}

@property(nonatomic, assign) NSObject <SerializeProtocol> *targetObject; 
@property(nonatomic, assign) NSObject *callbackObject; 

-(void) setupParser;
-(void) getDataFromUrl:(NSString *)url serializeToObject:  (NSObject <SerializeProtocol> *)target callbackToObject:(NSObject *) completedCallbackObject;
@end

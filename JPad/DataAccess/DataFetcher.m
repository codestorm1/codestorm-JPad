//
//  DataFetcher.m
//  JPad
//
//  Created by Bryan Green on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataFetcher.h"
#import "SBJson.h"
#import "ListBase.h"


@interface DataFetcher () <SBJsonStreamParserAdapterDelegate>
@end

@implementation DataFetcher

-(void) setupParser {

    
	// We don't want *all* the individual messages from the
	// SBJsonStreamParser, just the top-level objects. The stream
	// parser adapter exists for this purpose.
	adapter = [[SBJsonStreamParserAdapter alloc] init];
	
	// Set ourselves as the delegate, so we receive the messages
	// from the adapter.
	adapter.delegate = self;
	
	// Create a new stream parser..
	parser = [[SBJsonStreamParser alloc] init];
	
	// .. and set our adapter as its delegate.
	parser.delegate = adapter;
	
	// Normally it's an error if JSON is followed by anything but
	// whitespace. Setting this means that the parser will be
	// expecting the stream to contain multiple whitespace-separated
	// JSON documents.
	parser.supportMultipleDocuments = YES;
}

-(void) getDataFromUrl:(NSString *)url serializeToObject: (ListBase <SerializeProtocol> *)target callbackToObject:(NSObject *) completedCallbackObject {
    
    self.targetObject = target;
    self.callbackObject = completedCallbackObject;
    
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url]
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:20.0];
	
	theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}

#pragma mark SBJsonStreamParserAdapterDelegate methods

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array {
    //[NSException raise:@"unexpected" format:@"Should not get here"];
    
    [self.targetObject Deserialize:array];
    SEL dataFetchCompleted = @selector(dataFetchHasCompleted);
    if ([self.callbackObject respondsToSelector:dataFetchCompleted]) {
        [self.callbackObject performSelector:dataFetchCompleted];
    }
}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict {
    [self.targetObject Deserialize:dict];
    SEL dataFetchCompleted = @selector(dataFetchHasCompleted);
    if ([self.callbackObject respondsToSelector:dataFetchCompleted]) {
        [self.callbackObject performSelector:dataFetchCompleted];
    }
}

#pragma mark NSURLConnectionDelegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"Connection didReceiveResponse: %@ - %@", response, [response MIMEType]);
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	NSLog(@"Connection didReceiveAuthenticationChallenge: %@", challenge);
	
//	NSURLCredential *credential = [NSURLCredential credentialWithUser:username.text
//															 password:password.text
//														  persistence:NSURLCredentialPersistenceForSession];
	
//	[[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"Connection didReceiveData of length: %u", data.length);
	
	// Parse the new chunk of data. The parser will append it to
	// its internal buffer, then parse from where it left off in
	// the last chunk.
	SBJsonStreamParserStatus status = [parser parse:data];
	
	if (status == SBJsonStreamParserError) {
//        tweet.text = [NSString stringWithFormat: @"The parser encountered an error: %@", parser.error];
		NSLog(@"Parser error: %@", parser.error);
		
	} else if (status == SBJsonStreamParserWaitingForData) {
		NSLog(@"Parser waiting for more data");
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    NSString *errorMessage = [[NSString alloc] initWithFormat:@"Connection failed! Error - %@ %@",
                              [error localizedDescription],
                              [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]];
    NSLog(@"%@", [NSString stringWithFormat:@"%@", errorMessage]);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:errorMessage
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert autorelease];
    [alert show];
    [errorMessage release];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
}

@synthesize targetObject;
@synthesize callbackObject;


@end

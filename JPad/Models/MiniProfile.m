//
//  MiniProfile.m
//  JPad
//
//  Created by Bryan Green on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MiniProfile.h"


@implementation MiniProfile

@synthesize memberId;
@synthesize username;
@synthesize thumbnailUrl;
@synthesize thumbnailImage;
@synthesize photoUrl;
@synthesize maritalStatus;
@synthesize gender;
@synthesize seekingGender;
@synthesize age;
@synthesize location;
@synthesize lastLoggedIn;
@synthesize lastUpdatedProfile;
@synthesize isOnline;
@synthesize isPayingMember;    


-(void)Deserialize: (NSObject *)obj {
    
    NSDictionary *member = (NSDictionary *)obj;
    self.memberId = (NSNumber*)[member objectForKey:@"id"];
    self.username =      [member objectForKey:@"username"];
    if ([member objectForKey:@"thumbnailUrl"] != nil) {
        self.thumbnailUrl  = [NSString stringWithFormat:@"%@%@", @"http://www.jdate.com", [member objectForKey:@"thumbnailUrl"]];
    }
    if ([member objectForKey:@"photoUrl"] != nil) {
    self.photoUrl  =     [NSString stringWithFormat:@"%@%@", @"http://www.jdate.com", [member objectForKey:@"photoUrl"]];
    }
    self.maritalStatus = [member objectForKey:@"maritalStatus"];
    self.gender  = [member objectForKey:@"gender"];
    self.seekingGender  = [member objectForKey:@"genderSeeking"];
    self.age  = (NSNumber *)[member objectForKey:@"age"];
    self.location  = [member objectForKey:@"location"];
    self.lastLoggedIn  = [NSDate date]; //[member objectForKey:@"lastLoggedIn"];
    self.lastUpdatedProfile  = [member objectForKey:@"lastUpdatedProfile"];
    self.isOnline  = [member objectForKey:@"isOnline"];
    self.isPayingMember = [member objectForKey:@"isPayingMember"];

    if (self.thumbnailUrl != nil) {
        NSData* imageData;
        @try {
            imageData = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:self.thumbnailUrl]];
        }
        @catch (NSException * e) {
            //Some error while downloading data
        }
        @finally {
            self.thumbnailImage = [[UIImage alloc] initWithData:imageData];
            [imageData release];
        }
    }



}


@end

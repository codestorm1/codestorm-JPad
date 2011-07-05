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
@synthesize photoUrl;
@synthesize maritalStatus;
@synthesize gender;
@synthesize genderSeeking;
@synthesize age;
@synthesize location;
@synthesize lastLoggedIn;
@synthesize lastUpdatedProfile;
@synthesize isOnline;
@synthesize isPayingMember;    


-(void)Deserialize: (NSDictionary *)member {
    
    self.memberId = (int)[member objectForKey:@"id"];
    self.username =      [member objectForKey:@"username"];
    self.thumbnailUrl  = [member objectForKey:@"thumbnailUrl"];
    self.photoUrl  =     [member objectForKey:@"photoUrl"];
    self.maritalStatus = [member objectForKey:@"maritalStatus"];
    self.gender  = [member objectForKey:@"gender"];
    self.genderSeeking  = [member objectForKey:@"genderSeeking"];
    self.age  = (int)[member objectForKey:@"age"];
    self.location  = [member objectForKey:@"location"];
    self.lastLoggedIn  = [member objectForKey:@"lastLoggedIn"];
    self.lastUpdatedProfile  = [member objectForKey:@"lastUpdatedProfile"];
    self.isOnline  = [member objectForKey:@"isOnline"];
    self.isPayingMember = [member objectForKey:@"isPayingMember"];
}


@end

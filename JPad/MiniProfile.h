//
//  MiniProfile.h
//  JPad
//
//  Created by Bryan Green on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SerializeProtocol.h"

@interface MiniProfile : NSObject <SerializeProtocol> {
 
    int memberId;
    NSString *username;
    NSString *thumbnailUrl;
    NSString *photoUrl;
    NSString *maritalStatus;
    NSString *gender;
    NSString *genderSeeking;
    int age;
    NSString *location;
    NSDate *lastLoggedIn;
    NSDate *lastUpdatedProfile;
    bool isOnline;
    bool isPayingMember;    
}

@property(nonatomic, assign) int memberId; 
@property(nonatomic, retain) NSString *username; 
@property(nonatomic, retain) NSString *thumbnailUrl; 
@property(nonatomic, retain) NSString *photoUrl; 
@property(nonatomic, retain) NSString *maritalStatus; 
@property(nonatomic, retain) NSString *gender; 
@property(nonatomic, retain) NSString *genderSeeking; 
@property(nonatomic, retain) NSString *location; 
@property(nonatomic, assign) int age; 
@property(nonatomic, retain) NSDate *lastLoggedIn; 
@property(nonatomic, retain) NSDate *lastUpdatedProfile; 
@property(nonatomic, assign) bool isOnline;
@property(nonatomic, assign) bool isPayingMember;

@end

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
 
    NSNumber *memberId;
    NSString *username;
    NSString *thumbnailUrl;
    UIImage *image;
    NSString *photoUrl;
    NSString *maritalStatus;
    NSString *gender;
    NSString *genderSeeking;
    NSNumber *age;
    NSString *location;
    NSDate *lastLoggedIn;
    NSDate *lastUpdatedProfile;
    bool isOnline;
    bool isPayingMember;    
}

@property(nonatomic, retain) NSNumber *memberId; 
@property(nonatomic, retain) NSString *username; 
@property(nonatomic, retain) NSString *thumbnailUrl; 
@property(nonatomic, retain) UIImage *image; 
@property(nonatomic, retain) NSString *photoUrl; 
@property(nonatomic, retain) NSString *maritalStatus; 
@property(nonatomic, retain) NSString *gender; 
@property(nonatomic, retain) NSString *genderSeeking; 
@property(nonatomic, retain) NSString *location; 
@property(nonatomic, retain) NSNumber *age; 
@property(nonatomic, retain) NSDate *lastLoggedIn; 
@property(nonatomic, retain) NSDate *lastUpdatedProfile; 
@property(nonatomic, assign) bool isOnline;
@property(nonatomic, assign) bool isPayingMember;

@end

/*
 This module is licenced under the BSD license.
 
 Copyright (C) 2011 by raw engineering <nikhil.jain (at) raweng (dot) com, reefaq.mohammed (at) raweng (dot) com>.
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
//
//  MenuViewController.m
//  StackScrollView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 raw engineering . All rights reserved.
//

#import "MenuViewController.h"
#import "DataViewController.h"
#import "StackScrollViewAppDelegate.h"
#import "RootViewController.h"
#import "StackScrollViewController.h"
#import "MemberListViewController.h"
#import "HotListViewController.h"
#import "Feature.h"

@implementation MenuViewController
@synthesize tableView = _tableView;
@synthesize featureList = _featureList;


#pragma mark -
#pragma mark View lifecycle

- (id)initWithFrame:(CGRect)frame {
    [super init];
    if (self) {
		[self.view setFrame:frame]; 
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];        

//        Feature *searchResults = [[Feature alloc] initWithData:@"SearchResults" description:@"Search Results" resourceUrl:@"http://roflcode.appspot.com/static/SearchResults.json"];
//        Feature *viewedYou =     [[Feature alloc] initWithData:@"ViewedYou" description:@"Viewed You" resourceUrl:@"http://roflcode.appspot.com/static/ViewedMe.json"];
//        Feature *favoritedYou =  [[Feature alloc] initWithData:@"FavoritedYou" description:@"Favorited You" resourceUrl:@"http://roflcode.appspot.com/static/FavoritedMe.json"];
//        Feature *myFavorites =   [[Feature alloc] initWithData:@"MyFavorites" description:@"My Favorites" resourceUrl:@"http://roflcode.appspot.com/static/MyFavorites.json"];
        Feature *searchResults = [[Feature alloc] initWithData:@"SearchResults" description:@"Search Results" resourceUrl:@"http://lawebstage304/jdate.com/search/results/27029711/pagesize/20/page/1"];
        Feature *viewedYou =     [[Feature alloc] initWithData:@"ViewedYou" description:@"Viewed You" resourceUrl:@"http://lawebstage304/jdate.com/hotlist/WhoViewedYourProfile/27029711/pagesize/20/pagenumber/1"];
        Feature *favoritedYou =  [[Feature alloc] initWithData:@"FavoritedYou" description:@"Favorited You" resourceUrl:@"http://lawebstage304/jdate.com/hotlist/WhoAddedYouToTheirFavorites/27029711/pagesize/20/pagenumber/1"];
        Feature *myFavorites =   [[Feature alloc] initWithData:@"MyFavorites" description:@"My Favorites" resourceUrl:@"http://lawebstage304/jdate.com/hotlist/Default/27029711/pagesize/20/pagenumber/1"];

        _featureList= [[NSArray alloc] initWithObjects:
                        searchResults, viewedYou, favoritedYou, myFavorites, nil];
	
		_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
		[_tableView setDelegate:self];
		[_tableView setDataSource:self];
		[_tableView setBackgroundColor:[UIColor clearColor]];
		_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
		[self.view addSubview:_tableView];
		
		UIView* verticalLineView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, -5, 1, self.view.frame.size.height)];
		[verticalLineView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
		[verticalLineView setBackgroundColor:[UIColor whiteColor]];
		[self.view addSubview:verticalLineView];
		[self.view bringSubviewToFront:verticalLineView];
        [verticalLineView release];
        [searchResults release];
        [viewedYou release];
        [favoritedYou release];
        [myFavorites release];
        
        [pool release];
		
	}
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_featureList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		UIView* bgView = [[[UIView alloc] init] autorelease];
		[bgView setBackgroundColor:[UIColor colorWithWhite:2 alpha:0.2]];
		[cell setSelectedBackgroundView:bgView];
    }
    
    // Configure the cell...
	//cell.textLabel.text = [NSString stringWithFormat:@"Menu %d", indexPath.row +1];
    NSUInteger row = [indexPath row];
    Feature *feature = [_featureList objectAtIndex:row];
    if (feature != nil) {
        cell.textLabel.text = feature.description;
    }
	[cell.textLabel setTextColor:[UIColor whiteColor]];

    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    DataViewController *dataViewController = [[DataViewController alloc] initWithFrame:CGRectMake(0, 0, 477, self.view.frame.size.height)];
//	[[StackScrollViewAppDelegate instance].rootViewController.stackScrollViewController addViewInSlider:dataViewController invokeByController:self isStackStartView:TRUE];
//	[dataViewController release];

    NSUInteger row = [indexPath row];
    Feature *feature = [_featureList objectAtIndex:row];
    
    
    if (feature != nil) {
        
        if (feature.name == @"SearchResults") {
            MemberListViewController *memberListViewController = [[MemberListViewController alloc] initWithStyle:UITableViewStylePlain];
            memberListViewController.title = feature.description;
            [memberListViewController setResourceUrl:[feature resourceUrl]];
            [[StackScrollViewAppDelegate instance].rootViewController.stackScrollViewController addViewInSlider:memberListViewController invokeByController:self isStackStartView:TRUE];
            memberListViewController.view.frame = CGRectMake(0, 0, 350, self.view.frame.size.height);
            [memberListViewController release];
        }
        else {
            HotListViewController *hotListViewController = [[HotListViewController alloc] initWithStyle:UITableViewStylePlain];
            hotListViewController.title = feature.description;
            [self setTitle:@"????"];
            [hotListViewController setResourceUrl:[feature resourceUrl]];
            [[StackScrollViewAppDelegate instance].rootViewController.stackScrollViewController addViewInSlider:hotListViewController invokeByController:self isStackStartView:TRUE];
            hotListViewController.view.frame = CGRectMake(0, 0, 350, self.view.frame.size.height);
            [hotListViewController release];
        }
    }
    //MemberListViewController *memberListViewController = [[MemberListViewController alloc] initWithFrame:CGRectMake(0, 0, 477, self.view.frame.size.height)];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    //_featureList = nil;
    //_tableView = nil;
}


- (void)dealloc {

    [_featureList release];
    [_tableView release];
    self = nil;
    [super dealloc];
}


@end


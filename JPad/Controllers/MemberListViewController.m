//
//  MemberListViewController.m
//  JPad
//
//  Created by Bryan Green on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MemberListViewController.h"
#import "MiniProfile.h"
#import "StackScrollViewAppDelegate.h"
#import "RootViewController.h"
#import "StackScrollViewController.h"
#import "ProfileViewController.h"

@implementation MemberListViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)dealloc
{
    [itemList release];    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.itemList = [[MemberList alloc] init];
//    members = [[MemberList alloc] init];
    dataFetcher = [[DataFetcher alloc] init];
    [dataFetcher setupParser];
    
    [dataFetcher getDataFromUrl:resourceUrl serializeToObject:self.itemList callbackToObject:self];
    
    
    //    NSString *url = @"http://roflcode.appspot.com/static/MiniProfile.json";
    //    MiniProfile *miniProfile = [[MiniProfile alloc] init];
    //    [dataFetcher makeRequestToUrl:url serializeToObject: miniProfile];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    self.itemList = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.itemList.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //NSLog(@"creating new cell");        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    else {
        //NSLog(@"reusing cell");        
    }
    
    // Configure the cell...
    NSUInteger row = [indexPath row];
    MiniProfile *miniProfile = [self.itemList.items objectAtIndex:row];
    if (miniProfile != nil) {
        cell.textLabel.text = miniProfile.username;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@, %@", miniProfile.maritalStatus, miniProfile.age, miniProfile.location];
        
        if (miniProfile.thumbnailImage != nil){
            [[cell imageView] setImage:miniProfile.thumbnailImage];
            //[cell setFrame:CGRectMake(10, 10, 70, 70)];
            //NSLog(@"displaying miniProfile with username %@ marital status %@", miniProfile.username, miniProfile.maritalStatus);            
        }
        
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 60.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        UILabel *label = [[UILabel alloc] init];
//        [label setText:@"Scroll down to refresh"];
//        return label;
//    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//        UILabel *label = [[UILabel alloc] init];
//        [label setText:@"No more results"];
//        return label;
    return nil;
}
    /*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    profileViewController = [[ProfileViewController alloc] initWithNibName:@"ProfileViewController" bundle:nil];
    
    
    //CGRect frame = self.view.frame;
//    profileViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width * 1.7, self.view.frame.size.height);
    profileViewController.view.autoresizingMask = UIViewAutoresizingNone;
    NSUInteger row = [indexPath row];
    MiniProfile *miniProfile = [self.itemList.items objectAtIndex:row];
    if (miniProfile != nil) {
        profileViewController.miniProfile = miniProfile;
        [profileViewController refreshTheView];
    }
    CGRect frame = profileViewController.view.frame;
    profileViewController.view.frame = frame; // forces redraw, otherwise no thumbnail pic (?)

    
    //    [[profileViewController view] setBackgroundColor:[UIColor greenColor]];
    [[StackScrollViewAppDelegate instance].rootViewController.stackScrollViewController addViewInSlider:profileViewController invokeByController:self isStackStartView:FALSE];    
//    [[StackScrollViewAppDelegate instance].rootViewController.stackScrollViewController addViewInSlider:profileViewController invokeByController:self isStackStartView:FALSE];
//    [profileViewController release];

    
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end

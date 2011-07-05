//
//  HotListViewController.m
//  JPad
//
//  Created by Bryan Green on 7/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HotListTableViewController.h"
#import "DataFetcher.h"
#import "MiniProfile.h"


@implementation HotListTableViewController

@synthesize hotListMembers;

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
    [hotListMembers release];    
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
    
    self.hotListMembers = [[MemberList alloc] init];
    DataFetcher *dataFetcher = [[DataFetcher alloc] init];
    [dataFetcher setupParser];
    
    NSString *url =[[NSString alloc] initWithCString: "http://roflcode.appspot.com/static/SearchResults.json"];
    hotListMembers = [[MemberList alloc] init];
    [dataFetcher getDataFromUrl:url serializeToObject:self.hotListMembers callbackToObject:self];
    
    
    //    NSString *url = @"http://roflcode.appspot.com/static/MiniProfile.json";
    //    MiniProfile *miniProfile = [[MiniProfile alloc] init];
    //    [dataFetcher makeRequestToUrl:url serializeToObject: miniProfile];
    [url release];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) dataFetchHasCompleted {
    //tableViewController.members = self.hotListMembers;
    // MemberList *test = self.hotListMembers;
    // self.hotListMembers = members;
    //    NSLog("count is: %s", [test count]);
    //    NSLog("count is: %s", self.hotListMembers.count);
    [self.tableView reloadData];

}

- (void)viewDidUnload
{
    self.hotListMembers = nil;
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
    return [self.hotListMembers.memberArray count];
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
    MiniProfile *miniProfile = [self.hotListMembers.memberArray objectAtIndex:row];
    if (miniProfile != nil) {
        cell.textLabel.text = miniProfile.username;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@ %@", miniProfile.maritalStatus, miniProfile.age, miniProfile.location];
        
        if (miniProfile.image != nil){
            [[cell imageView] setImage:miniProfile.image];
            //NSLog(@"displaying miniProfile with username %@ marital status %@", miniProfile.username, miniProfile.maritalStatus);            
        }
        
        return cell;
    }
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

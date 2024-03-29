//
//  Novidades.m
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Novidades.h"
#import "Posts.h"
#import "Urls.h"
#import "Postagem.h"
#import "LeitorRSSAppDelegate.h"

@implementation Novidades

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
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
    LeitorRSSAppDelegate *appDelegate = (LeitorRSSAppDelegate *)[[UIApplication sharedApplication] delegate];    
    moc = appDelegate.managedObjectContext;
    
    NSEntityDescription *objUrls = [NSEntityDescription entityForName:@"Urls" inManagedObjectContext:moc];
    
    NSFetchRequest *urlReq = [[NSFetchRequest alloc] init];
    [urlReq setEntity: objUrls];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome" ascending:YES];  
    NSArray *arraySD = [NSArray arrayWithObject:sortDescriptor];
    [urlReq setSortDescriptors:arraySD];  
    [sortDescriptor release];
    
    NSError *error;  
    NSMutableArray *arrayFeeds = [[moc executeFetchRequest:urlReq error:&error] mutableCopy];
    
    [urlReq release];
    
    cabecalhos = [[NSMutableArray alloc] initWithArray:arrayFeeds];
    
    
    NSMutableArray *arrayPosts = [[NSMutableArray alloc] init];
    
    for (Urls *u in arrayFeeds)
    {
        NSEntityDescription *objPosts = [NSEntityDescription entityForName:@"Posts" inManagedObjectContext:moc];
        
        NSFetchRequest *reqPosts = [[NSFetchRequest alloc] init];
        [reqPosts setEntity:objPosts];
        
        NSPredicate *predPosts = [NSPredicate predicateWithFormat:@"feed_url == %@",[u url]];
        [reqPosts setPredicate:predPosts];
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"data_publicacao" ascending:NO];  
        NSArray *arraySD = [NSArray arrayWithObject:sortDescriptor];
        [reqPosts setSortDescriptors:arraySD];  
        [sortDescriptor release];
        
        NSError *error;  
        NSMutableArray *arrayTempPosts = [[moc executeFetchRequest:reqPosts error:&error] mutableCopy];
        
        [arrayPosts addObject:[arrayTempPosts objectAtIndex:0]];
        
        [reqPosts release];
    }
    
    itens = [[NSMutableArray alloc] initWithArray:arrayPosts];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [cabecalhos count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [[itens objectAtIndex:indexPath.section] titulo];
    
    // Configure the cell...
    
    return cell;
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
    Postagem *viewpost = [[Postagem alloc] init];
    [viewpost setPost:[itens objectAtIndex:indexPath.section]];
    [self.navigationController pushViewController:viewpost animated:YES];
    [viewpost release];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [[cabecalhos objectAtIndex:section] nome];
}
@end

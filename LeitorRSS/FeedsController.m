//
//  FeedsController.m
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FeedsController.h"
#import "EditFeeds.h"
#import "LeitorRSSAppDelegate.h"
#import "Urls.h"
#import "PostsController.h"


@implementation FeedsController
@synthesize listaFeed;

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
    [self abrirDados];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [listaFeed count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [[listaFeed objectAtIndex:[indexPath row]] nome];
    
    // Configure the cell...
    
    return cell;
}

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
    PostsController *pcontrol = [[PostsController alloc] init];
    [pcontrol setUrlAtual:[listaFeed objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:pcontrol animated:YES];
    [pcontrol release];
    
}

- (void)dealloc
{
    [listaFeed release];
    [super dealloc];
}

-(IBAction)novoFeed:(id)sender
{
    NSLog(@"passou 1");
    EditFeeds *editFeeds = [[[EditFeeds alloc] init] autorelease];
    NSLog(@"passou 2");
    [editFeeds setParent:self];
    NSLog(@"passou 3");
    [self presentModalViewController:editFeeds animated:YES];
}

-(void)abrirDados
{
    LeitorRSSAppDelegate *appDelegate = (LeitorRSSAppDelegate *)[[UIApplication sharedApplication] delegate];    
    moc = appDelegate.managedObjectContext;
    
    listaFeed = [[NSMutableArray alloc] init];
    
    NSEntityDescription *objUrls = [NSEntityDescription entityForName:@"Urls" inManagedObjectContext:moc];
    
    NSFetchRequest *urlReq = [[NSFetchRequest alloc] init];
    [urlReq setEntity: objUrls];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome" ascending:YES];  
    NSArray *arraySD = [NSArray arrayWithObject:sortDescriptor];
    [urlReq setSortDescriptors:arraySD];  
    [sortDescriptor release];
    
    NSError *error;  
    NSMutableArray *arrayResultados = [[moc executeFetchRequest:urlReq error: &error] mutableCopy];
    
    listaFeed = arrayResultados;
    [urlReq release];
    [self.tableView reloadData];
    
    
}
@end

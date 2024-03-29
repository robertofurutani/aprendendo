//
//  ContatoListController.m
//  TesteCoreData
//
//  Created by Roberto J Furutani on 29/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContatoListController.h"
#import "Formulario.h"

@implementation ContatoListController

@synthesize managedObjectContext, arrayLista;

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
    self.title = @"Contatos";
    UIBarButtonItem *addBotao = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNovoRegistro:)];
    self.navigationItem.rightBarButtonItem = addBotao;
    [addBotao release];
    
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [arrayLista count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    Contato *contato = [[self arrayLista] objectAtIndex:[indexPath row]];
    [cell.textLabel setText:[contato nome]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@ anos",[contato idade]]]; 
    
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
    Formulario *form = [[Formulario alloc] init];
	form.managedObjectContext = self.managedObjectContext;
	form.viewParent = self;
    
	form.contatoAtual=[arrayLista objectAtIndex:[indexPath row]];
    
	[self presentModalViewController:form animated:YES];
}

-(void)listaRegistros 
{

    NSEntityDescription *entContatos = [NSEntityDescription entityForName:@"Contato" inManagedObjectContext:managedObjectContext]; 
    
    // Declara o objeto "request"
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // Define a entidade para o objeto "request"
    [request setEntity:entContatos];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nome" ascending:YES];  
    NSArray *arraySD = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:arraySD];  
    [sortDescriptor release];
    
    NSError *error;  
    NSMutableArray *fetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];   
    
    if (!fetchResults) {  
        NSLog(@"Algo de errado aconteceu!");
    }  
    
    [self setArrayLista:fetchResults];  
    [fetchResults release];  
    [request release]; 
}

-(void) dealloc {
    [managedObjectContext release];
    [arrayLista release];
    [super dealloc];
}

-(void)addNovoRegistro:(id)sender 
{
	Formulario *form = [[Formulario alloc] init];
	[form setManagedObjectContext:[self managedObjectContext]];
	[form setViewParent:self];
	[self presentModalViewController:form animated:YES];
}

@end

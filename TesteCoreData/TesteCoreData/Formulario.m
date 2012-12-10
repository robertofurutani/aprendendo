//
//  Formulario.m
//  TesteCoreData
//
//  Created by Roberto J Furutani on 29/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Formulario.h"

@implementation Formulario
@synthesize managedObjectContext, contatoAtual, txtNome, txtIdade, btnSave, btnExcluir, viewParent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

- (void)viewDidLoad {
    
    [super viewDidLoad];
	self.txtNome.text = [self.contatoAtual nome];
	self.txtIdade.text = [NSString stringWithFormat:@"%d",[[self.contatoAtual idade] intValue]];
    
	if (self.contatoAtual !=nil)
	{
		[btnSave setTitle:@"Alterar" forState:UIControlStateNormal];
		btnExcluir.hidden = NO;
        btnExcluir.enabled = YES;
	}
    
   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)doCancel:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)doSave:(id)sender
{	
	Contato *contato;
    
	if (contatoAtual != nil) {
		contato = contatoAtual;
	}
	else {
		contato = (Contato *)[NSEntityDescription insertNewObjectForEntityForName:@"Contato" inManagedObjectContext:managedObjectContext];
	}
    
    [contato setNome:[txtNome text]];
    [contato setIdade:[NSNumber numberWithInt:[[txtIdade text] intValue]]];
    
    NSError *error;  
	if(![managedObjectContext save:&error]){  
        NSLog(@"houve um erro muito grave"  );
    }  
    
	[viewParent listaRegistros];
	[viewParent.tableView reloadData];
    
	[self dismissModalViewControllerAnimated:YES];
}

-(IBAction)doDelete:(id)sender
{
    NSLog(@"delete");
	NSManagedObject *contato = contatoAtual;
	[managedObjectContext deleteObject:contato];
    
	NSError *error;  
	if(![managedObjectContext save:&error]){  
        NSLog(@"houve um erro muito grave");
    }  
    
	[viewParent listaRegistros];
	[viewParent.tableView reloadData];
	[self dismissModalViewControllerAnimated:YES];
}

- (void)dealloc {
	[managedObjectContext release];
	[contatoAtual release];
	[txtNome release];
	[txtIdade release];
	[btnSave release];
	[btnExcluir release];
	[viewParent release];
    
    [super dealloc];
}

@end

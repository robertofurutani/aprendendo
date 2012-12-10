//
//  EditFeeds.m
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditFeeds.h"
#import "XMLParser.h"

@implementation EditFeeds
@synthesize parent;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

-(IBAction)fechar:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    
    NSLog(@"passou");
}

-(void)dealloc
{
    NSLog(@"deal 1");
    [parent dealloc];
    NSLog(@"deal 2");
    [super dealloc];
}

-(IBAction)doSave:(id)sender
{   
    NSString *feedURL = [[NSString alloc] initWithFormat:@"http://%@",[txtFeed text]];
    XMLParser *xmlp = [[XMLParser alloc] initWithUrlFeed:feedURL];
    [xmlp parse];
    [xmlp release];
    [feedURL release];
    [self dismissModalViewControllerAnimated:YES];
}

@end

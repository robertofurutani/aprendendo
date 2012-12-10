//
//  Postagem.m
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Postagem.h"


@implementation Postagem
@synthesize post;

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
    NSString *html_css = @"<link href=\"postagem.css\" rel=\"stylesheet\" type=\"text/css\" />";
        

    NSString *html_titulo = [[NSString alloc] initWithFormat:@"<h1>%@</h1>",[post titulo]];
    
    NSString *html_conteudo = [[NSString alloc] initWithFormat:@"<div class=\"conteudo\">%@</div>", [post conteudo]];
    
    [webConteudo loadHTMLString:[NSString stringWithFormat:@"%@%@", html_titulo, html_conteudo] baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    
    [webConteudo loadHTMLString:[NSString stringWithFormat:@"%@%@%@", html_css, html_titulo, html_conteudo] baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]]];
    
    [html_titulo release];
    [html_conteudo release];
    
    [self setTitle:[post titulo]];
    
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
- (void)dealloc
{
    [post release];
    [super dealloc];
}
@end

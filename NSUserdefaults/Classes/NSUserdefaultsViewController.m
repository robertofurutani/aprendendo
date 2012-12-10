//
//  NSUserdefaultsViewController.m
//  NSUserdefaults
//
//  Created by Matheus Brum on 10/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "NSUserdefaultsViewController.h"

@implementation NSUserdefaultsViewController
@synthesize label;
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSUserDefaults *pontosPath = [NSUserDefaults standardUserDefaults];
	numero = [pontosPath integerForKey:@"integerKey"];
    
    NSURL *url = [NSURL URLWithString:@"http://sms.elucid.com.br:9090/AgenciaSMSWeb/"];
    
    
    
    NSString *content = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
    NSRange range = [content rangeOfString:@":="];
    range.location = range.location + 2;
    range.length = 5;
    NSString *versao = [content substringWithRange:range];
    
	label.text = versao; //[NSString stringWithFormat:@"%i", numero];
    [super viewDidLoad];
}

-(void)atualizar {
	label.text = [NSString stringWithFormat:@"%i", numero];
}
-(IBAction)mais{
	numero = numero + 1;
	[self atualizar];
}
-(IBAction)menos{
	numero = numero - 1;
	[self atualizar];
}
-(IBAction)salvar{
	NSUserDefaults *pontosPath = [NSUserDefaults standardUserDefaults];
	[pontosPath setInteger:numero forKey:@"integerKey"];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end

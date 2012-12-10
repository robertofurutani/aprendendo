//
//  ObjectCOOPrinciplesViewController.m
//  ObjectCOOPrinciples
//
//  Created by Jair Rillo Junior on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ObjectCOOPrinciplesViewController.h"

@implementation ObjectCOOPrinciplesViewController

-(IBAction)drawCircle
{
	shape = [[Circle alloc] init];
	[shape drawShape];
}

-(IBAction)drawRectangle
{
	shape = [[Rectangle alloc] init];
	[shape drawShape];
}

- (void)dealloc {
	[shape release];
    [super dealloc];
}

@end

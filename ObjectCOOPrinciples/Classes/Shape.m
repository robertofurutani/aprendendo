//
//  Shape.m
//  ObjectCOOPrinciples
//
//  Created by Jair Rillo Junior on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Shape.h"


@implementation Shape

-(void)setColor:(NSString *)aColor
{
	color = aColor;
}

-(void)drawShape
{
	NSLog(@"Drawing a shape...");
}

@end

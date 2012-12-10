//
//  ObjectCOOPrinciplesViewController.h
//  ObjectCOOPrinciples
//
//  Created by Jair Rillo Junior on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Circle.h"
#import "Rectangle.h"

@interface ObjectCOOPrinciplesViewController : UIViewController {
	@private
	Shape *shape;
}

-(IBAction)drawCircle;
-(IBAction)drawRectangle;

@end


//
//  Shape.h
//  ObjectCOOPrinciples
//
//  Created by Jair Rillo Junior on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Shape : NSObject {
@private
	NSString *color;
	CGPoint *position;
}
-(void)setColor:(NSString *)aColor;
-(void)drawShape;

@end

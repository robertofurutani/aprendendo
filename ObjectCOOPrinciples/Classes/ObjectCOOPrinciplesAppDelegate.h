//
//  ObjectCOOPrinciplesAppDelegate.h
//  ObjectCOOPrinciples
//
//  Created by Jair Rillo Junior on 7/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ObjectCOOPrinciplesViewController;

@interface ObjectCOOPrinciplesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ObjectCOOPrinciplesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ObjectCOOPrinciplesViewController *viewController;

@end


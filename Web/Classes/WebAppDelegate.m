//
//  WebAppDelegate.m
//  Web
//
//  Created by Matheus Brum on 10/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "WebAppDelegate.h"
#import "WebViewController.h"

@implementation WebAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

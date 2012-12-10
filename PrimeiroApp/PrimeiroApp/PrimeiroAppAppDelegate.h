//
//  PrimeiroAppAppDelegate.h
//  PrimeiroApp
//
//  Created by Roberto J Furutani on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PrimeiroAppViewController;

@interface PrimeiroAppAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PrimeiroAppViewController *viewController;

@end

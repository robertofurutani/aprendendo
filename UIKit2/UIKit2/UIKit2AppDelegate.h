//
//  UIKit2AppDelegate.h
//  UIKit2
//
//  Created by Roberto J Furutani on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIKit2ViewController;

@interface UIKit2AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UIKit2ViewController *viewController;

@end

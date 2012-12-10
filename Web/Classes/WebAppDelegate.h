//
//  WebAppDelegate.h
//  Web
//
//  Created by Matheus Brum on 10/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;

@interface WebAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WebViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet WebViewController *viewController;

@end


//
//  NSUserdefaultsAppDelegate.h
//  NSUserdefaults
//
//  Created by Matheus Brum on 10/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSUserdefaultsViewController;

@interface NSUserdefaultsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    NSUserdefaultsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet NSUserdefaultsViewController *viewController;

@end


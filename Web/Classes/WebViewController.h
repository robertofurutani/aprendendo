//
//  WebViewController.h
//  Web
//
//  Created by Matheus Brum on 10/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController {
	IBOutlet UIWebView *webView;

}
@property (nonatomic,retain) UIWebView *webView;

@end


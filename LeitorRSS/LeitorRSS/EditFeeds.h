//
//  EditFeeds.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedsController.h"

@interface EditFeeds : UIViewController
{
    IBOutlet UITextField *txtFeed;
    FeedsController *parent;
}

@property (nonatomic, retain) FeedsController *parent;

-(IBAction)doSave:(id)sender;
-(IBAction)fechar:(id)sender;

@end

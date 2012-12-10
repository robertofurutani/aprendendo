//
//  PostsController.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Urls.h"
#import "LeitorRSSAppDelegate.h"

@interface PostsController : UITableViewController{

    
    NSMutableArray *items;
    Urls *urlAtual;
    NSManagedObjectContext *moc;
    
}
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) Urls *urlAtual;

@end

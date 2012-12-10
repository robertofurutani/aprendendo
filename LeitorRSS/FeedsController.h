//
//  FeedsController.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedsController : UITableViewController
{
    NSMutableArray *listaFeed;
    NSManagedObjectContext *moc;
}

@property (nonatomic, retain) NSMutableArray *listaFeed;

-(IBAction)novoFeed:(id)sender;
-(void)abrirDados;


@end

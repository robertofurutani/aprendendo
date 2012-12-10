//
//  Novidades.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Novidades : UITableViewController{
    NSMutableArray *itens;
    NSMutableArray *cabecalhos;
    NSManagedObjectContext *moc;
}
@end

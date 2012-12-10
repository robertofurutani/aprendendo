//
//  ContatoListController.h
//  TesteCoreData
//
//  Created by Roberto J Furutani on 29/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"

@interface ContatoListController : UITableViewController {
    NSManagedObjectContext *managedObjectContext;
    NSMutableArray *arrayLista;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSMutableArray *arrayLista;
    

-(void)listaRegistros;
-(void)addNovoRegistro:(id)sender;

@end

//
//  Formulario.h
//  TesteCoreData
//
//  Created by Roberto J Furutani on 29/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Contato.h"
#import "ContatoListController.h"

@interface Formulario : UIViewController {
    
	Contato *contatoAtual;
	ContatoListController *viewParent;
    
	NSManagedObjectContext *managedObjectContext;
    
	IBOutlet UITextField *txtNome;
	IBOutlet UITextField *txtIdade;
	IBOutlet UIButton *btnSave;
	IBOutlet UIButton *btnCancelar;
	IBOutlet UIButton *btnExcluir;
}

@property (nonatomic, retain) Contato *contatoAtual;
@property (nonatomic, retain) ContatoListController *viewParent;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) IBOutlet UITextField *txtNome;
@property (nonatomic, retain) IBOutlet UITextField *txtIdade;
@property (nonatomic, retain) IBOutlet UIButton *btnSave;
@property (nonatomic, retain) IBOutlet UIButton *btnExcluir;

-(IBAction)doSave:(id)sender;
-(IBAction)doCancel:(id)sender;
-(IBAction)doDelete:(id)sender;

@end
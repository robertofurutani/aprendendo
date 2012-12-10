//
//  PrimeiroAppViewController.h
//  PrimeiroApp
//
//  Created by Roberto J Furutani on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrimeiroAppViewController : UIViewController {

    IBOutlet UILabel *mensagem;
    IBOutlet UITextField *nome;
}

-(IBAction) dizerOla;

@end

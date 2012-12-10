//
//  AloMundoViewController.h
//  AloMundo
//
//  Created by Roberto Furutani on 29/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AloMundoViewController : UIViewController{
        
    IBOutlet UITextField *nome; 
    IBOutlet UILabel *msg;   
    
}

    - (IBAction) exibirOla;   


@end

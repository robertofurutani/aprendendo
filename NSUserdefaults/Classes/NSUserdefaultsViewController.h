//
//  NSUserdefaultsViewController.h
//  NSUserdefaults
//
//  Created by Matheus Brum on 10/10/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSUserdefaultsViewController : UIViewController {
	IBOutlet UILabel *label;
	NSInteger numero;
}
-(void)atualizar;
-(IBAction)mais;
-(IBAction)menos;
-(IBAction)salvar;
@property (nonatomic,retain) IBOutlet UILabel *label;
@end


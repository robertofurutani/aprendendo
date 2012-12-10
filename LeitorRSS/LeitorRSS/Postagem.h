//
//  Postagem.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Posts.h"

@interface Postagem : UIViewController
{
    IBOutlet UIWebView *webConteudo;
    Posts *post;
}
@property (nonatomic, retain) Posts *post;
@end

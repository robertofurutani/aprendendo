//
//  FeedPosts.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedPosts : NSObject {

    NSString *titulo;
    NSString *conteudo;
    NSString *pubData;
    NSString *guid;
    
}

@property (nonatomic, retain) NSString *titulo;
@property (nonatomic, retain) NSString *conteudo;
@property (nonatomic, retain) NSString *pubData;
@property (nonatomic, retain) NSString *guid;

-(id)initWithTitulo:(NSString *)tit conteudo:(NSString *)cont pubData:(NSString *)pubd guid:(NSString *)g;

@end

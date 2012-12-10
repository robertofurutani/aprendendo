//
//  FeedPosts.m
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FeedPosts.h"

@implementation FeedPosts

@synthesize titulo, conteudo, pubData, guid;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(id)initWithTitulo:(NSString *)tit conteudo:(NSString *)cont pubData:(NSString *)pubd guid:(NSString *)g
{
    if (self == [super init])
    {
        self.titulo = tit;
        self.conteudo = cont;
        self.pubData = pubd;
        self.guid = g;
    }
    return self;
}

-(void)dealloc
{
    [guid release];
    [titulo release];
    [conteudo release];
    [pubData release];
    [super dealloc];
}

@end

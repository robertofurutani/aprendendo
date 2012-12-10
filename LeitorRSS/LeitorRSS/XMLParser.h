//
//  XMLParser.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject <NSXMLParserDelegate> {
    
    NSString *urlFeed;    
    
    NSMutableArray *items;
    BOOL channelElementInProgress;
    BOOL itemElementInProgress;
    NSMutableString *dadoAtual;
    NSManagedObjectContext *moc;
    
    NSString *nomeFeed;
    NSString *tempTitulo;
    NSString *tempConteudo;
    NSString *tempPubData;
    NSString *tempGuid;
    
}
@property BOOL channelElementInProgress;
@property BOOL itemElementInProgress;
@property (nonatomic, retain) NSString *urlFeed;

-(BOOL)parse;
-(id)initWithUrlFeed:(NSString *)url;
@end

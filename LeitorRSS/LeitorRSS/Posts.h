//
//  Posts.h
//  LeitorRSS
//
//  Created by Roberto Furutani on 15/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Posts : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * attribute;
@property (nonatomic, retain) NSString * guid;
@property (nonatomic, retain) NSString * titulo;
@property (nonatomic, retain) NSString * conteudo;
@property (nonatomic, retain) NSDate * data_publicacao;

@end

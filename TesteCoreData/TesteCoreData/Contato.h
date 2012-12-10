//
//  Contato.h
//  TesteCoreData
//
//  Created by Roberto J Furutani on 29/09/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contato : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * idade;

@end

//
//  TesteCoreDataAppDelegate.h
//  TesteCoreData
//
//  Created by Roberto J Furutani on 29/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TesteCoreDataAppDelegate : NSObject <UIApplicationDelegate>{
    UINavigationController *navControl;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, retain) UINavigationController *navControl;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

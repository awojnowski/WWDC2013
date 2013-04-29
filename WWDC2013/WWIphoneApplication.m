//
//  WWIphoneApplication.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWIphoneApplication.h"

@implementation WWIphoneApplication

+(WWIphoneApplication *)applicationWithImage:(UIImage *)image name:(NSString *)name {
    
    return [self applicationWithImage:image name:name storeID:nil];
    
}

+(WWIphoneApplication *)applicationWithImage:(UIImage *)image name:(NSString *)name storeID:(NSString *)storeID {
    
    WWIphoneApplication *application = [[WWIphoneApplication alloc] init];
    [application setImage:image];
    [application setName:name];
    [application setStoreID:storeID];
    return application;
    
}

@end

//
//  WWIphoneApplication.h
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WWIphoneApplication : NSObject

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *storeID;

+(WWIphoneApplication *)applicationWithImage:(UIImage *)image name:(NSString *)name;
+(WWIphoneApplication *)applicationWithImage:(UIImage *)image name:(NSString *)name storeID:(NSString *)storeID;

@end

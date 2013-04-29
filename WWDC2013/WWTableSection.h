//
//  WWTableSection.h
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWTableSection : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *identifier;

@property (nonatomic, strong) Class cellClass;

+(WWTableSection *)tableSectionWithClassName:(NSString *)className title:(NSString *)title;

@end

//
//  WWTableSection.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTableSection.h"

@implementation WWTableSection

#pragma mark - Static

+(WWTableSection *)tableSectionWithClassName:(NSString *)className title:(NSString *)title {
    
    WWTableSection *section = [[WWTableSection alloc] init];
    [section setCellClass:NSClassFromString(className)];
    [section setIdentifier:className];
    [section setTitle:title];
    return section;
    
}

@end

//
//  WWTextDisplayViewController.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-28.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTextDisplayViewController.h"

#import "WWTextDisplayContentsViewController.h"

@interface WWTextDisplayViewController ()

@property (nonatomic, weak) WWTextDisplayContentsViewController *textDisplayContentViewController;

@end

@implementation WWTextDisplayViewController

-(id)init {
    
    self = [super init];
    if (self) {
        
        [self setViewControllers:@[[[WWTextDisplayContentsViewController alloc] init]]];
        [self setTextDisplayContentViewController:[self viewControllers][0]];
        
    }
    
    return self;
    
}

#pragma mark - Getters & Setters

-(void)setText:(NSString *)text {
    
    [self willChangeValueForKey:@"text"];
    _text = text;
    [self didChangeValueForKey:@"text"];
    
    [[self textDisplayContentViewController] setText:text];
    
}

-(void)setTitle:(NSString *)title {
    
    [super setTitle:title];
    
    [[self textDisplayContentViewController] setTitle:title];
    
}

@end

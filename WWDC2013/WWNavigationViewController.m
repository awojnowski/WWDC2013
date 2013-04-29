//
//  WWNavigationViewController.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-28.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWNavigationViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface WWNavigationViewController ()

@end

@implementation WWNavigationViewController

-(id)init {
    
    self = [super init];
    if (self) {
        
        [[self navigationBar] setTintColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0]];
        [[self navigationBar] setTitleTextAttributes:@{
                                UITextAttributeFont : [UIFont boldSystemFontOfSize:20.0],
                           UITextAttributeTextColor : [UIColor darkGrayColor],
                     UITextAttributeTextShadowColor : [UIColor whiteColor],
                    UITextAttributeTextShadowOffset : [NSValue valueWithCGSize:CGSizeMake(0, -1)]
         }];
        
        [[UIBarButtonItem appearanceWhenContainedIn:[self class], nil] setTitleTextAttributes:@{
                                                                         UITextAttributeFont : [UIFont boldSystemFontOfSize:12.0],
                                                                    UITextAttributeTextColor : [UIColor darkGrayColor],
                                                              UITextAttributeTextShadowColor : [UIColor whiteColor],
                                                             UITextAttributeTextShadowOffset : [NSValue valueWithCGSize:CGSizeMake(0, -1)]
         } forState:UIControlStateNormal];
        
    }
    
    return self;
    
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[self view] setClipsToBounds:YES];
    [[[self view] layer] setCornerRadius:10.0];
    
}

@end

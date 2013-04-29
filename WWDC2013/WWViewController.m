//
//  WWViewController.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface WWViewController ()

@end

@implementation WWViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[self view] setClipsToBounds:YES];
    [[[self view] layer] setCornerRadius:10.0];
    
}

@end

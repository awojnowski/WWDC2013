//
//  WWAppInformationViewController.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWAppInformationViewController.h"

#import "WWIphoneApplication.h"

#import "SVProgressHUD.h"

#import <StoreKit/StoreKit.h>

@interface WWAppInformationViewController () <SKStoreProductViewControllerDelegate>

@end

@implementation WWAppInformationViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    WWIphoneApplication *application = [self application];
    [self setTitle:[application name]];
    
    NSString *filename = nil;
    
    if ([[application name] isEqualToString:@"Musi"]) {
        
        filename = @"response-musi";
        
    } else if ([[application name] isEqualToString:@"Minus"]) {
     
        filename = @"response-minus";
        
    } else if ([[application name] isEqualToString:@"Other"]) {
        
        filename = @"response-other";
        
    }
    
    NSString *text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:@""] encoding:NSUTF8StringEncoding error:nil];
    [self setText:text];
    
    if ([[application storeID] length] > 0) {
        
        [[[self viewControllers][0] navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"View App" style:UIBarButtonItemStyleBordered target:self action:@selector(viewApplication:)]];
        
    }
    
}

#pragma mark - Actions

-(void)viewApplication:(id)sender {
        
    NSString *storeID = [[self application] storeID];
    
    [SVProgressHUD showWithStatus:@"Loading App Store" maskType:SVProgressHUDMaskTypeGradient];
    
    SKStoreProductViewController *productViewController = [[SKStoreProductViewController alloc] init];
    [productViewController setDelegate:self];
    [productViewController loadProductWithParameters:@{
        SKStoreProductParameterITunesItemIdentifier : storeID
     } completionBlock:^(BOOL result, NSError *error) {
         
         if (result) {
             
             [SVProgressHUD dismiss];
             
             [self presentViewController:productViewController animated:YES completion:nil];
             
         } else [SVProgressHUD showErrorWithStatus:@"Error loading App Store"];
         
     }];
    
}

#pragma mark - SKStoreProductViewControllerDelegate

-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end

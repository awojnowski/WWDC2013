//
//  WWHomeViewController.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWHomeViewController.h"

#import "WWBackgroundScrollView.h"
#import "WWParallaxTableView.h"

#import "WWTableSection.h"

#import "WWMyAppsParallaxTableViewCell.h"
#import "WWTellUsMoreParallaxTableViewCell.h"

#import "WWIphoneApplication.h"
#import "WWAppInformationViewController.h"

@interface WWHomeViewController ()

@property (nonatomic, strong) WWBackgroundScrollView *scrollView;

@property (nonatomic, strong) WWParallaxTableView *tableView;

@end

@implementation WWHomeViewController

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    // fix issue with coming back from a modal view controller
    // and having the parallax background view incorrectly aligned
    [[self tableView] setContentOffset:CGPointMake([[self tableView] contentOffset].x, [[self tableView] contentOffset].y + 1)];
    
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor blackColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openedApplication:) name:kMyAppsParallaxTableViewCellOpenedApplicationNotificationName object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openedTellUsMore:) name:kWWTellUsMoreParallaxTableViewCellOpenedTextDisplayViewControllerNotificationName object:nil];
    
    WWBackgroundScrollView *backgroundScrollView = [[WWBackgroundScrollView alloc] init];
    [backgroundScrollView setFrame:[[UIScreen mainScreen] bounds]];
    [backgroundScrollView setContentSize:CGSizeMake(320, 1000)];
    [[self view] addSubview:backgroundScrollView];
    [self setScrollView:backgroundScrollView];
    
    NSString * (^parsedClassNameFromIdentifier)(NSString *) = ^(NSString *identifier) {
        
        return [NSString stringWithFormat:@"WW%@ParallaxTableViewCell",identifier];
        
    };
    
    WWParallaxTableView *parallaxTableView = [[WWParallaxTableView alloc] init];
    [parallaxTableView setFrame:[backgroundScrollView bounds]];
    [parallaxTableView setParallaxScrollView:backgroundScrollView];
    [parallaxTableView setTableSections:@[
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"Introduction") title:nil],
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"TableOfContents") title:nil],
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"AboutMe") title:@"About Me"],
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"TechnicalSkills") title:@"My Technical Skills"],
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"Interests") title:@"My Interests"],
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"Education") title:@"My Education"],
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"MyApps") title:@"My Technical Work"],
     [WWTableSection tableSectionWithClassName:parsedClassNameFromIdentifier(@"TellUsMore") title:@"\"Tell Us More\""]
    ]];
    [[self view] addSubview:parallaxTableView];
    [self setTableView:parallaxTableView];
        
}

#pragma mark - NSNotifications

-(void)openedApplication:(NSNotification *)notification {
    
    WWIphoneApplication *application = [notification userInfo][@"application"];
    
    WWAppInformationViewController *appInformationViewController = [[WWAppInformationViewController alloc] init];
    [appInformationViewController setApplication:application];
    [appInformationViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentViewController:appInformationViewController animated:YES completion:nil];
    
}

-(void)openedTellUsMore:(NSNotification *)notification {
    
    WWTextDisplayViewController *textDisplayViewController = [notification userInfo][@"viewController"];
    [self presentViewController:textDisplayViewController animated:YES completion:nil];
    
}

@end

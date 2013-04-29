//
//  WWTellUsMoreParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTellUsMoreParallaxTableViewCell.h"

#import "WWTranslucentTableViewCell.h"

#import "WWLabel.h"

#import "WWTextDisplayViewController.h"

@interface WWTellUsMoreParallaxTableViewCell () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *optionsTableView;

@property (nonatomic, weak) WWLabel *thankYouLabel;

@end

@implementation WWTellUsMoreParallaxTableViewCell

-(void)sharedInit {
    
    [super sharedInit];
    
}

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) style:UITableViewStyleGrouped];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setScrollEnabled:NO];
    [tableView setBackgroundView:nil];
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [parallaxView addSubview:tableView];
    [self setOptionsTableView:tableView];
    
    WWLabel *thankYouLabel = [[WWLabel alloc] init];
    [thankYouLabel setFrame:CGRectMake(20, 200, 280, 300)];
    [thankYouLabel setBackgroundColor:[UIColor clearColor]];
    [thankYouLabel setTextColor:[UIColor whiteColor]];
    [thankYouLabel setFont:[UIFont systemFontOfSize:24.0]];
    [thankYouLabel setShadowOffset:CGSizeMake(0, 1)];
    [thankYouLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [thankYouLabel setNumberOfLines:0];
    [thankYouLabel setTextAlignment:NSTextAlignmentCenter];
    [thankYouLabel setText:@"Thank you for considering me for the WWDC Student Scholarship.\n\n♥"];
    [parallaxView addSubview:thankYouLabel];
    [self setThankYouLabel:thankYouLabel];
    
    [parallaxView setFrame:CGRectMake(0, 0, 320, 490)];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
        
    [[self thankYouLabel] setTransform:CGAffineTransformMakeScale(0.5 + parallaxOffset / 2.0, 0.5 + parallaxOffset / 2.0)];
            
}

#pragma mark - UITableViewDelegate

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WWTranslucentTableViewCell *cell = [[WWTranslucentTableViewCell alloc] init];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:14.0]];
    [[cell textLabel] setTextColor:[UIColor darkGrayColor]];
    [cell setAlpha:0.9];
            
    switch ([indexPath row]) {
            
        case 0:
            [[cell textLabel] setText:@"My Years Developing on iOS"];
            break;
        case 1:
            [[cell textLabel] setText:@"Important Lesson Developing Apps"];
            break;
        case 2:
            [[cell textLabel] setText:@"Improving A Frequently Used App"];
            break;
        case 3:
            [[cell textLabel] setText:@"Why Do You Want To Go To WWDC?"];
            break;
            
    }
    
    return cell;
    
}

#pragma mark - UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *filename = nil;
    NSString *title = nil;
    
    switch ([indexPath row]) {
            
        case 0:
            filename = @"response-iosyears";
            title = @"Years With iOS";
            break;
        case 1:
            filename = @"response-lesson";
            title = @"My Lesson";
            break;
        case 2:
            filename = @"response-improving";
            title = @"App Improvement";
            break;
        case 3:
            filename = @"response-why";
            title = @"WWDC... Why?";
            break;
            
    }
    
    NSString *text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:filename ofType:@""] encoding:NSUTF8StringEncoding error:nil];
    
    WWTextDisplayViewController *textDisplayViewController = [[WWTextDisplayViewController alloc] init];
    [textDisplayViewController setText:text];
    [textDisplayViewController setTitle:title];
    [textDisplayViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kWWTellUsMoreParallaxTableViewCellOpenedTextDisplayViewControllerNotificationName object:nil userInfo:@{ @"viewController" : textDisplayViewController }];

}

@end

//
//  WWMyAppsParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWMyAppsParallaxTableViewCell.h"

#import "WWLabel.h"

#import "WWIphoneView.h"
#import "WWIphoneApplication.h"

@interface WWMyAppsParallaxTableViewCell () <WWIphoneViewDelegate>

@property (nonatomic, strong) WWIphoneView *iphoneView;

@property (nonatomic, strong) WWLabel *titleLabel;
@property (nonatomic, strong) WWLabel *tapThemLabel;

@end

@implementation WWMyAppsParallaxTableViewCell

-(void)sharedInit {
    
    [super sharedInit];
    
}

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    WWIphoneView *iphoneView = [[WWIphoneView alloc] init];
    [iphoneView setFrame:CGRectMake((320 - [iphoneView frame].size.width) / 2.0, 20, [iphoneView frame].size.width, [iphoneView frame].size.height)];
    [iphoneView setDelegate:self];
    [iphoneView setApplications:@[
     [WWIphoneApplication applicationWithImage:[UIImage imageNamed:@"musiIcon@2x"] name:@"Musi" storeID:@"591560124"],
     [WWIphoneApplication applicationWithImage:[UIImage imageNamed:@"minusIcon@2x"] name:@"Minus" storeID:@"585660589"],
     [WWIphoneApplication applicationWithImage:[UIImage imageNamed:@"mploydIcon@2x"] name:@"Mployd"],
     [WWIphoneApplication applicationWithImage:[UIImage imageNamed:@"MCTTIcon@2x"] name:@"MCTT"],
     [WWIphoneApplication applicationWithImage:[UIImage imageNamed:@"flashlightMeIcon@2x"] name:@"FL ME"],
     [WWIphoneApplication applicationWithImage:[UIImage imageNamed:@"appStorageIcon@2x"] name:@"Storage"],
     [WWIphoneApplication applicationWithImage:[UIImage imageNamed:@"otherIcon@2x"] name:@"Other"]
    ]];
    [parallaxView addSubview:iphoneView];
    [self setIphoneView:iphoneView];
    
    WWLabel *titleLabel = [[WWLabel alloc] init];
    [titleLabel setFrame:CGRectMake(0, -10 - 30, [iphoneView frame].size.width, 30)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:24.0]];
    [titleLabel setShadowOffset:CGSizeMake(0, 1)];
    [titleLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [titleLabel setNumberOfLines:0];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:@"These are my apps."];
    [iphoneView addSubview:titleLabel];
    [self setTitleLabel:titleLabel];
    
    WWLabel *tapThemLabel = [[WWLabel alloc] init];
    [tapThemLabel setFrame:CGRectMake(0, ([iphoneView frame].size.height - 60) / 2.0, [iphoneView frame].size.width, 60)];
    [tapThemLabel setBackgroundColor:[UIColor clearColor]];
    [tapThemLabel setTextColor:[UIColor whiteColor]];
    [tapThemLabel setFont:[UIFont systemFontOfSize:18.0]];
    [tapThemLabel setShadowOffset:CGSizeMake(0, 1)];
    [tapThemLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [tapThemLabel setNumberOfLines:0];
    [tapThemLabel setTextAlignment:NSTextAlignmentCenter];
    [tapThemLabel setText:@"You can tap on them\nto find out more."];
    [tapThemLabel setUserInteractionEnabled:NO];
    [iphoneView addSubview:tapThemLabel];
    [self setTapThemLabel:tapThemLabel];
    
    [parallaxView setFrame:CGRectMake(0, 0, 320, 1400)];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
    
    CGFloat staticDistance = 880;
    
    if (parallaxOffset < 0.3) {
        
        CGFloat phoneTransform = 1.0 - [self offsetForParallaxOffset:parallaxOffset betweenOffset:0.2 andOffset:0.3];
        [[self iphoneView] setTransform:CGAffineTransformMakeTranslation(0, phoneTransform * 500)];
                
    } else if (parallaxOffset < 1.0) {
        
        CGFloat phoneTransform = [self offsetForParallaxOffset:parallaxOffset betweenOffset:0.3 andOffset:1.0];
        [[self iphoneView] setTransform:CGAffineTransformMakeTranslation(0, phoneTransform * staticDistance)];
        
    } else if (parallaxOffset > 1.0) {
        
        CGFloat phoneTransform = [self offsetForParallaxOffset:parallaxOffset betweenOffset:1.0 andOffset:1.1];
        [[self iphoneView] setTransform:CGAffineTransformMakeTranslation(0, staticDistance + phoneTransform * -500)];
                
    }
    
    CGFloat titleLabelOffset = [self offsetForParallaxOffset:parallaxOffset betweenOffset:0.3 andOffset:0.4];
    [[self titleLabel] setAlpha:titleLabelOffset];
    
    CGFloat tapThemLabelOffset = [self offsetForParallaxOffset:parallaxOffset betweenOffset:0.4 andOffset:0.6];
    [[self tapThemLabel] setAlpha:tapThemLabelOffset];
    
}

#pragma mark - WWIphoneViewDelegate

-(void)iPhoneView:(WWIphoneView *)iphoneView didTapApplication:(WWIphoneApplication *)application {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kMyAppsParallaxTableViewCellOpenedApplicationNotificationName object:self userInfo:@{ @"application" : application }];
    
}

@end

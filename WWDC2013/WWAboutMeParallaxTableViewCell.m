//
//  WWAboutMeParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWAboutMeParallaxTableViewCell.h"

#import "WWLabel.h"

#import <QuartzCore/QuartzCore.h>

@interface WWAboutMeParallaxTableViewCell ()

@property (nonatomic, strong) UIView *staticView;

@property (nonatomic, strong) UIImageView *armImageView;

@property (nonatomic, strong) WWLabel *sayingLabel;

@end

@implementation WWAboutMeParallaxTableViewCell {
    
    CGFloat _staticOffset;
    
    NSArray *_sayings;
    
}

-(void)sharedInit {
    
    _staticOffset = NSNotFound;
    
    _sayings = @[
                 @"Hey, I'm Aaron.",
                 @"I'm 17 years old.",
                 @"I was born and raised in Winnipeg, Canada",
                 @"I'm finishing my last year of high school.",
                 @"I make iOS apps."
    ];
    
    [super sharedInit];
    
}

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    UIView *staticView = [[UIView alloc] init];
    [staticView setFrame:CGRectMake(0, 0, 320, 568)];
    [staticView setBackgroundColor:[UIColor clearColor]];
    [parallaxView addSubview:staticView];
    [self setStaticView:staticView];
    
    UIView *backgroundImageViewBackgroundView = [[UIView alloc] init];
    [backgroundImageViewBackgroundView setFrame:CGRectMake(40, 100, 240, 240)];
    [[backgroundImageViewBackgroundView layer] setCornerRadius:120];
    [staticView addSubview:backgroundImageViewBackgroundView];
    
    [[backgroundImageViewBackgroundView layer] setShadowRadius:5.0];
    [[backgroundImageViewBackgroundView layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[backgroundImageViewBackgroundView layer] setShadowOpacity:0.5];
    [[backgroundImageViewBackgroundView layer] setShadowOffset:CGSizeMake(0.0, 0.0)];
    [[backgroundImageViewBackgroundView layer] setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, [backgroundImageViewBackgroundView frame].size.width, [backgroundImageViewBackgroundView frame].size.height) cornerRadius:[[backgroundImageViewBackgroundView layer] cornerRadius]] CGPath]];
    [[backgroundImageViewBackgroundView layer] setShouldRasterize:YES];
    [[backgroundImageViewBackgroundView layer] setRasterizationScale:[[UIScreen mainScreen] scale]];
    
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    [backgroundImageView setFrame:[backgroundImageViewBackgroundView bounds]];
    [backgroundImageView setImage:[UIImage imageNamed:@"aboutMeBackground@2x"]];
    [backgroundImageView setClipsToBounds:YES];
    [[backgroundImageView layer] setCornerRadius:120];
    [backgroundImageViewBackgroundView addSubview:backgroundImageView];
    
    UIImageView *armImageView = [[UIImageView alloc] init];
    [armImageView setFrame:CGRectMake(32, 53, 38, 231)];
    [armImageView setImage:[UIImage imageNamed:@"aboutMeArm@2x"]];
    [backgroundImageView addSubview:armImageView];
    [self setArmImageView:armImageView];
    
    CGFloat sayingLabelOrigin = [backgroundImageView frame].origin.y + [backgroundImageView frame].size.height + 20;
    
    WWLabel *sayingLabel = [[WWLabel alloc] init];
    [sayingLabel setFrame:CGRectMake(30, sayingLabelOrigin, 260, [staticView frame].size.height - sayingLabelOrigin - 20)];
    [sayingLabel setBackgroundColor:[UIColor clearColor]];
    [sayingLabel setTextColor:[UIColor whiteColor]];
    [sayingLabel setFont:[UIFont systemFontOfSize:24.0]];
    [sayingLabel setShadowOffset:CGSizeMake(0, 1)];
    [sayingLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [sayingLabel setNumberOfLines:0];
    [sayingLabel setTextAlignment:NSTextAlignmentCenter];
    [sayingLabel setText:_sayings[0]];
    [staticView addSubview:sayingLabel];
    [self setSayingLabel:sayingLabel];
    
    [parallaxView setFrame:CGRectMake(0, 0, 320, 2000)];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
    
    CGFloat ourHeight = [[self class] height];
    
    if (_staticOffset == NSNotFound) _staticOffset = [[self parentTableView] frame].size.height / ourHeight;
    
    if (parallaxOffset >= _staticOffset) {
        
        if (parallaxOffset < 1.0) {
            
            CGFloat difference = parallaxOffset - _staticOffset;
            [[self staticView] setTransform:CGAffineTransformMakeTranslation(0, difference * (ourHeight + 100))];
            
            CGFloat staticOffsetBase = 1.0 - _staticOffset;
            CGFloat sayingStep = difference / staticOffsetBase;
            
            int sayingIndex = floor(sayingStep * [_sayings count]);
            [[self sayingLabel] setText:_sayings[sayingIndex]];
            
        }
                
    } else [[self staticView] setTransform:CGAffineTransformMakeTranslation(0, 0)];
    
    // rotate the arm
    
    CGFloat armOffset = parallaxOffset * 40;
    
    [[self armImageView] setTransform:CGAffineTransformMakeRotation(M_PI / armOffset)];
    
}

@end

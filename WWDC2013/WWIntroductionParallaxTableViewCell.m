//
//  WWIntroductionParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWIntroductionParallaxTableViewCell.h"

#import "WWLabel.h"

@interface WWIntroductionParallaxTableViewCell ()

@property (nonatomic, weak) UIView *swipeView;

@property (nonatomic, weak) UIImageView *logoImageView;
@property (nonatomic, weak) UIImageView *arrowImageView;

@end

@implementation WWIntroductionParallaxTableViewCell

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    UIImageView *logoImageView = [[UIImageView alloc] init];
    [logoImageView setFrame:CGRectMake(50, 50, 220, 210)];
    [logoImageView setImage:[UIImage imageNamed:@"WWDCLogo@2x"]];
    [parallaxView addSubview:logoImageView];
    [self setLogoImageView:logoImageView];
    
    UIView *swipeView = [[UIView alloc] init];
    [swipeView setFrame:CGRectMake(0, 568 - 80, 320, 80)];
    [swipeView setBackgroundColor:[UIColor clearColor]];
    [parallaxView addSubview:swipeView];
    [self setSwipeView:swipeView];
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    [arrowImageView setFrame:CGRectMake((320 - 25) / 2.0, 0, 25, 25)];
    [arrowImageView setImage:[UIImage imageNamed:@"arrow"]];
    [arrowImageView setTransform:CGAffineTransformMakeRotation(M_PI)];
    [swipeView addSubview:arrowImageView];
    [self setArrowImageView:arrowImageView];
    
    WWLabel *swipeLabel = [[WWLabel alloc] init];
    [swipeLabel setFrame:CGRectMake(0, [arrowImageView frame].origin.y + [arrowImageView frame].size.height + 10, 320, 20)];
    [swipeLabel setBackgroundColor:[UIColor clearColor]];
    [swipeLabel setTextColor:[UIColor whiteColor]];
    [swipeLabel setFont:[UIFont systemFontOfSize:14.0]];
    [swipeLabel setShadowOffset:CGSizeMake(0, 1)];
    [swipeLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [swipeLabel setTextAlignment:NSTextAlignmentCenter];
    [swipeLabel setText:@"Swipe Up To Begin"];
    [swipeView addSubview:swipeLabel];
    
    CGFloat titleLabelOrigin = [logoImageView frame].origin.y + [logoImageView frame].size.height;
    CGFloat titleLabelHeight = 568 - titleLabelOrigin - [swipeView frame].size.height;
    
    WWLabel *titleLabel = [[WWLabel alloc] init];
    [titleLabel setFrame:CGRectMake(0, titleLabelOrigin, 320, titleLabelHeight)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:24.0]];
    [titleLabel setShadowOffset:CGSizeMake(0, 1)];
    [titleLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [titleLabel setNumberOfLines:0];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:@"Aaron Wojnowski's\nWWDC 2013 Student\nScholarship Application"];
    [parallaxView addSubview:titleLabel];
    
    [parallaxView setFrame:CGRectMake(0, 0, 320, 568)];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
    
    [super setParallaxOffset:parallaxOffset];
    
    if (parallaxOffset > 1.0) {
        
        // fade the swipe view
        
        CGFloat alpha = 1.0 - ((parallaxOffset - 1.0) / 0.35);
        if (alpha > 1.0) alpha = 1.0;
        
        [[self swipeView] setAlpha:alpha];
        
    }
    
    // adjust the wwdc logo
    
    CGFloat scale = 1.0 - ((parallaxOffset - 1.0) * 0.5);
    
    [[self logoImageView] setTransform:CGAffineTransformMakeScale(scale, scale)];
    
}

@end

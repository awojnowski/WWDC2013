//
//  WWInterestsParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-26.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWInterestsParallaxTableViewCell.h"

#import "WWLabel.h"

#import <QuartzCore/QuartzCore.h>

@interface WWInterestsView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation WWInterestsView

-(id)init {
 
    self = [super init];
    if (self) {
                
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView setFrame:CGRectMake(20, 0, 280, 80)];
        [self addSubview:imageView];
        [self setImageView:imageView];
        
        [[imageView layer] setShadowRadius:5.0];
        [[imageView layer] setShadowColor:[[UIColor blackColor] CGColor]];
        [[imageView layer] setShadowOpacity:0.5];
        [[imageView layer] setShadowOffset:CGSizeMake(0.0, 0.0)];
        [[imageView layer] setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, [imageView frame].size.width, [imageView frame].size.height) cornerRadius:[[imageView layer] cornerRadius]] CGPath]];
        [[imageView layer] setShouldRasterize:YES];
        [[imageView layer] setRasterizationScale:[[UIScreen mainScreen] scale]];
        
        WWLabel *label = [[WWLabel alloc] init];
        [label setFrame:CGRectMake(0, 80, 300, 40)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor whiteColor]];
        [label setFont:[UIFont systemFontOfSize:16.0]];
        [label setShadowOffset:CGSizeMake(0, 1)];
        [label setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
        [label setNumberOfLines:0];
        [label setTextAlignment:NSTextAlignmentRight];
        [self addSubview:label];
        [self setLabel:label];
        
    }
    
    return self;
    
}

@end

@interface WWInterestsParallaxTableViewCell ()

@property (nonatomic, weak) WWInterestsView *appsPeopleLoveView;
@property (nonatomic, weak) WWInterestsView *videoGamesView;
@property (nonatomic, weak) WWInterestsView *travellingView;
@property (nonatomic, weak) WWInterestsView *skydivingView;

@end

@implementation WWInterestsParallaxTableViewCell

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    WWInterestsView *appsPeopleLoveView = [[WWInterestsView alloc] init];
    [appsPeopleLoveView setFrame:CGRectMake(0, 20, 320, 120)];
    [[appsPeopleLoveView imageView] setImage:[UIImage imageNamed:@"interestsProducts@2x"]];
    [[appsPeopleLoveView label] setText:@"I enjoy creating products people love"];
    [parallaxView addSubview:appsPeopleLoveView];
    [self setAppsPeopleLoveView:appsPeopleLoveView];
    
    WWInterestsView *videoGamesView = [[WWInterestsView alloc] init];
    [videoGamesView setFrame:CGRectMake(0, [appsPeopleLoveView frame].origin.y + [appsPeopleLoveView frame].size.height + 20, 320, 120)];
    [[videoGamesView imageView] setImage:[UIImage imageNamed:@"interestsVideoGames@2x"]];
    [[videoGamesView label] setText:@"... and also playing video games"];
    [parallaxView addSubview:videoGamesView];
    [self setVideoGamesView:videoGamesView];
    
    WWInterestsView *travellingView = [[WWInterestsView alloc] init];
    [travellingView setFrame:CGRectMake(0, [videoGamesView frame].origin.y + [videoGamesView frame].size.height + 20, 320, 120)];
    [[travellingView imageView] setImage:[UIImage imageNamed:@"interestsTravelling@2x"]];
    [[travellingView label] setText:@"I love travelling and experiencing new things"];
    [parallaxView addSubview:travellingView];
    [self setTravellingView:travellingView];
    
    WWInterestsView *skydivingView = [[WWInterestsView alloc] init];
    [skydivingView setFrame:CGRectMake(0, [travellingView frame].origin.y + [travellingView frame].size.height + 20, 320, 120)];
    [[skydivingView imageView] setImage:[UIImage imageNamed:@"interestsSkydiving@2x"]];
    [[skydivingView label] setText:@"... and also jumping out of planes"];
    [parallaxView addSubview:skydivingView];
    [self setSkydivingView:skydivingView];
    
    [[self appsPeopleLoveView] setAlpha:0.0];
    [[self videoGamesView] setAlpha:0.0];
    [[self travellingView] setAlpha:0.0];
    [[self skydivingView] setAlpha:0.0];
        
    [parallaxView setFrame:CGRectMake(0, 0, 320, [skydivingView frame].origin.y + [skydivingView frame].size.height + 20)];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
    
    void (^animateViewBetweenFloats)(UIView *view, CGFloat offset) = ^(UIView *view, CGFloat offset) {
                
        [view setAlpha:offset];
        
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = -1 / 500.0;
        rotationAndPerspectiveTransform = CATransform3DRotate(rotationAndPerspectiveTransform, 0.5 - (offset * 0.5), 1.0f, 0.0f, 0.0f);
        rotationAndPerspectiveTransform = CATransform3DScale(rotationAndPerspectiveTransform, 0.9 + (offset * 0.1), 0.9 + (offset * 0.1), 1.0);
        [[view layer] setTransform:rotationAndPerspectiveTransform];
        

    };
    animateViewBetweenFloats([self appsPeopleLoveView],[self offsetForParallaxOffset:parallaxOffset betweenOffset:0.45 andOffset:0.7]);
    animateViewBetweenFloats([self videoGamesView],[self offsetForParallaxOffset:parallaxOffset betweenOffset:0.6 andOffset:0.85]);
    animateViewBetweenFloats([self travellingView],[self offsetForParallaxOffset:parallaxOffset betweenOffset:0.75 andOffset:1.0]);
    animateViewBetweenFloats([self skydivingView],[self offsetForParallaxOffset:parallaxOffset betweenOffset:0.9 andOffset:1.15]);
    
}

@end

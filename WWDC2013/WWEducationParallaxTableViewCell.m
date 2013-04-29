//
//  WWEducationParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-26.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWEducationParallaxTableViewCell.h"

#import "WWLabel.h"

@interface WWEducationParallaxTableViewCell ()

@property (nonatomic, weak) UIView *staticView;

@property (nonatomic, weak) UIImageView *iconImageView;

@property (nonatomic, weak) UILabel *graduatingLabel;
@property (nonatomic, weak) UILabel *universityLabel;

@end

@implementation WWEducationParallaxTableViewCell {
        
}

-(void)sharedInit {
    
    [super sharedInit];
    
}

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    [iconImageView setFrame:CGRectMake(110, 30, 100, 100)];
    [iconImageView setImage:[UIImage imageNamed:@"graduateIcon@2x"]];
    [self addSubview:iconImageView];
    [self setIconImageView:iconImageView];
    
    WWLabel *graduatingLabel = [[WWLabel alloc] init];
    [graduatingLabel setFrame:CGRectMake(50, 30 + 100 + 30, 220, 90)];
    [graduatingLabel setBackgroundColor:[UIColor clearColor]];
    [graduatingLabel setTextColor:[UIColor whiteColor]];
    [graduatingLabel setFont:[UIFont systemFontOfSize:24.0]];
    [graduatingLabel setShadowOffset:CGSizeMake(0, 1)];
    [graduatingLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [graduatingLabel setNumberOfLines:0];
    [graduatingLabel setTextAlignment:NSTextAlignmentCenter];
    [graduatingLabel setText:@"I'm graduating from high school this June."];
    [parallaxView addSubview:graduatingLabel];
    [self setGraduatingLabel:graduatingLabel];
    
    WWLabel *universityLabel = [[WWLabel alloc] init];
    [universityLabel setFrame:CGRectMake(50, [graduatingLabel frame].origin.y + [graduatingLabel frame].size.height + 30, 220, 120)];
    [universityLabel setBackgroundColor:[UIColor clearColor]];
    [universityLabel setTextColor:[UIColor whiteColor]];
    [universityLabel setFont:[UIFont systemFontOfSize:24.0]];
    [universityLabel setShadowOffset:CGSizeMake(0, 1)];
    [universityLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [universityLabel setNumberOfLines:0];
    [universityLabel setTextAlignment:NSTextAlignmentCenter];
    [universityLabel setText:@"Then studying Computer Science at the University of Manitoba."];
    [parallaxView addSubview:universityLabel];
    [self setUniversityLabel:universityLabel];
        
    [parallaxView setFrame:CGRectMake(0, 0, 320, ([universityLabel frame].origin.y + [universityLabel frame].size.height + 30))];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
            
    [[self graduatingLabel] setTransform:CGAffineTransformMakeTranslation(0, parallaxOffset * 50)];
    [[self universityLabel] setTransform:CGAffineTransformMakeTranslation(0, parallaxOffset * 100)];
    
    CGFloat graduatingOffset = [self offsetForParallaxOffset:parallaxOffset betweenOffset:1.5 andOffset:1.75];
    CGFloat universityOffset = [self offsetForParallaxOffset:parallaxOffset betweenOffset:1.75 andOffset:2.0];
    
    [[self graduatingLabel] setAlpha:1.0 - graduatingOffset];
    [[self universityLabel] setAlpha:1.0 - universityOffset];
    
    [[self iconImageView] setTransform:CGAffineTransformMakeScale(0.5 + parallaxOffset, 0.5 + parallaxOffset)];
            
}

@end

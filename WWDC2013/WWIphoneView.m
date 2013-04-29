//
//  WWIphoneView.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWIphoneView.h"

#import "WWIphoneApplication.h"

#import <QuartzCore/QuartzCore.h>

@interface WWIphoneView ()

@property (nonatomic, weak) UIView *applicationView;

@end

@implementation WWIphoneView

-(id)init {
    
    self = [super init];
    if (self) {
        
        [self setFrame:CGRectMake(0, 0, 300, 630)];
        
        UIImageView *backgroundImageView = [[UIImageView alloc] init];
        [backgroundImageView setFrame:CGRectMake(0, 0, 300, 630)];
        [backgroundImageView setImage:[UIImage imageNamed:@"iPhone5@2x"]];
        [self addSubview:backgroundImageView];
        
        UIScrollView *applicationView = [[UIScrollView alloc] init];
        [applicationView setFrame:CGRectMake(25, 110, 252, 350)];
        [applicationView setContentSize:CGSizeMake(253, 0)];
        [applicationView setShowsHorizontalScrollIndicator:NO];
        [applicationView setShowsVerticalScrollIndicator:NO];
        [self addSubview:applicationView];
        [self setApplicationView:applicationView];
        
    }
    
    return self;
    
}

#pragma mark - Getters & Setters

-(void)setApplications:(NSArray *)applications {
    
    [self willChangeValueForKey:@"applications"];
    _applications = applications;
    [self didChangeValueForKey:@"applications"];
    
    for (id subview in [[self applicationView] subviews]) [subview removeFromSuperview];
    
    CGFloat padding = 14.0;
    CGFloat i = 0;
    CGFloat y = padding;
    
    CGFloat x = 0;
    for (WWIphoneApplication *application in applications) {
        
        UIView *buttonSuperview = [[UIView alloc] init];
        [buttonSuperview setFrame:CGRectMake(i * (45 + padding) + padding, y, 45, 45)];
        [[self applicationView] addSubview:buttonSuperview];
        
        [[buttonSuperview layer] setCornerRadius:10.0];
        [[buttonSuperview layer] setShadowRadius:0.0];
        [[buttonSuperview layer] setShadowColor:[[UIColor blackColor] CGColor]];
        [[buttonSuperview layer] setShadowOpacity:0.75];
        [[buttonSuperview layer] setShadowOffset:CGSizeMake(0.0, 1.0)];
        [[buttonSuperview layer] setShadowPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, [buttonSuperview frame].size.width, [buttonSuperview frame].size.height) cornerRadius:[[buttonSuperview layer] cornerRadius]] CGPath]];
        [[buttonSuperview layer] setShouldRasterize:YES];
        [[buttonSuperview layer] setRasterizationScale:[[UIScreen mainScreen] scale]];
        
        UIButton *button = [[UIButton alloc] init];
        [button setFrame:[buttonSuperview bounds]];
        [button setTag:x];
        [button addTarget:self action:@selector(tappedButton:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[application image] forState:UIControlStateNormal];
        [button setClipsToBounds:YES];
        [[button layer] setCornerRadius:10.0];
        [buttonSuperview addSubview:button];
        
        UILabel *label = [[UILabel alloc] init];
        [label setFrame:CGRectMake([buttonSuperview frame].origin.x, [buttonSuperview frame].origin.y + [buttonSuperview frame].size.height, 45, 20)];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setText:[application name]];
        [label setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]];
        [label setShadowOffset:CGSizeMake(0, 1)];
        [label setFont:[UIFont boldSystemFontOfSize:10.0]];
        [label setTextColor:[UIColor whiteColor]];
        [[self applicationView] addSubview:label];
        
        i ++;
        x ++;
        
        if (i >= 4) {
            
            i = 0;
            y += padding + 65;
            
        }
        
    }
    
}

#pragma mark - Actions

-(void)tappedButton:(id)sender {
    
    int index = [sender tag];
    WWIphoneApplication *application = [self applications][index];
    
    if ([[self delegate] respondsToSelector:@selector(iPhoneView:didTapApplication:)])
        [[self delegate] performSelector:@selector(iPhoneView:didTapApplication:) withObject:self withObject:application];
    
}

@end

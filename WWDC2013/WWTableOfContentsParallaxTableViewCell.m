//
//  WWTableOfContentsParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTableOfContentsParallaxTableViewCell.h"

#import "WWLabel.h"

#import "WWTranslucentTableViewCell.h"

@interface WWTableOfContentsParallaxTableViewCell () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UITableView *contentsTableView;

@end

@implementation WWTableOfContentsParallaxTableViewCell

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    WWLabel *titleLabel = [[WWLabel alloc] init];
    [titleLabel setFrame:CGRectMake(-320, 50 - 28, 320, 28)];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont systemFontOfSize:24.0]];
    [titleLabel setShadowOffset:CGSizeMake(0, 1)];
    [titleLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
    [titleLabel setNumberOfLines:0];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:@"Table of Contents"];
    [titleLabel setAlpha:0.0];
    [parallaxView addSubview:titleLabel];
    [self setTitleLabel:titleLabel];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 500) style:UITableViewStyleGrouped];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setScrollEnabled:NO];
    [tableView setBackgroundView:nil];
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [parallaxView addSubview:tableView];
    [self setContentsTableView:tableView];
    
    [parallaxView setFrame:CGRectMake(0, 0, 320, 570)];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
    
    if (parallaxOffset > 0.5) {
        
        // title fade/transform
        
        CGFloat alpha = (parallaxOffset - 0.5) / 0.25;
        if (alpha > 1.0) alpha = 1.0;
        [[self titleLabel] setAlpha:alpha];
        
        CGFloat transform = ((parallaxOffset - 0.5) / 0.3) * 320;
        if (transform > 320) transform = 320;
        [[self titleLabel] setTransform:CGAffineTransformMakeTranslation(transform, 0)];
        
    }
    
}

#pragma mark - UITableViewDelegate

-(int)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
    
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) return 4;
    if (section == 1) return 1;
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WWTranslucentTableViewCell *cell = [[WWTranslucentTableViewCell alloc] init];
    [[cell textLabel] setFont:[UIFont systemFontOfSize:14.0]];
    [[cell textLabel] setTextColor:[UIColor darkGrayColor]];
    [cell setAlpha:0.9];
    
    switch ([indexPath section]) {
            
        case 0:
            
            switch ([indexPath row]) {
                    
                case 0:
                    [[cell textLabel] setText:@"About Me"];
                    break;
                case 1:
                    [[cell textLabel] setText:@"My Technical Skills"];
                    break;
                case 2:
                    [[cell textLabel] setText:@"My Interests"];
                    break;
                case 3:
                    [[cell textLabel] setText:@"My Education"];
                    break;
                    
            }
            
            break;
        case 1:
            
            switch ([indexPath row]) {
                    
                case 0:
                    [[cell textLabel] setText:@"My Apps"];
                    break;
                    
            }
            
            break;
        case 2:
            
            switch ([indexPath row]) {
                    
                case 0:
                    [[cell textLabel] setText:@"\"Tell Us More\""];
                    break;
                    
            }
            
            break;
            
    }
    
    return cell;
    
}

#pragma mark - UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    int ipSection = [indexPath section];
    int ipRow = [indexPath row];
    
    int section = 2 + ipRow;
    int totalSections = 3;
    
    for (int i = 0; i < totalSections; ++i) {
        
        if (i > 0) {
            
            section += (ipSection >= i) ? [self tableView:tableView numberOfRowsInSection:i - 1] : 0;
            
        }
                
    }
    
    [[self parentTableView] scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:section] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end

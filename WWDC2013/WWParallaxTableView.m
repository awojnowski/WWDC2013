//
//  WWParallaxTableView.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWParallaxTableView.h"
#import "WWParallaxTableViewCell.h"

#import "WWTableSection.h"

#import "WWParallaxTableViewCell.h"

#import "WWTableHeaderView.h"

#import "WWAppInformationViewController.h"

@interface WWParallaxTableView () <UITableViewDataSource, UITableViewDelegate>



@end

@implementation WWParallaxTableView

-(id)init {
    
    self = [super init];
    if (self) {
        
        [self setDelegate:self];
        [self setDataSource:self];
        
        [self setParallaxOffset:0.5];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSeparatorColor:[UIColor clearColor]];
        [self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
                
    }
    
    return self;
    
}

#pragma mark - UITableViewDataSource

-(int)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [[self tableSections] count];
    
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.0;
    
    WWTableSection *tableSection = [self tableSections][section];
    
    NSString *title = [tableSection title];
    if ([title length] > 0) {
        
        return 40.0;
        
    }
    
    return 0.0;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    WWTableSection *tableSection = [self tableSections][section];
    
    NSString *title = [tableSection title];
    if ([title length] > 0) {
        
        WWTableHeaderView *headerView = [[WWTableHeaderView alloc] init];
        [headerView setFrame:CGRectMake(0, 0, 320, 40)];
        [headerView setText:title];
        return headerView;
        
    }
    
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WWTableSection *tableSection = [self tableSections][[indexPath section]];
    return [[tableSection cellClass] height];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WWTableSection *tableSection = [self tableSections][[indexPath section]];
    
    NSString *identifier = [tableSection identifier];
    WWParallaxTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
                
        Class cellClass = [tableSection cellClass];
        
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell setParentTableView:self];
        
    }
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ;
    
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset = [scrollView contentOffset].y;
    CGFloat bottomOffset = offset + [scrollView frame].size.height;
    
    [[self parallaxScrollView] setContentOffset:CGPointMake([[self parallaxScrollView] contentOffset].x, offset * [self parallaxOffset])];
    
    for (WWParallaxTableViewCell *cell in [self visibleCells]) {
        
        CGFloat bOffset = bottomOffset - [cell frame].origin.y;
        
        CGFloat cellOffset = [cell frame].size.height;
        CGFloat parallaxOffset = bOffset / cellOffset;
                                                
        [cell setParallaxOffset:parallaxOffset];
        
    }
    
}

#pragma mark - Getters & Setters

-(void)setTableSections:(NSArray *)tableSections {
    
    [self willChangeValueForKey:@"tableSections"];
    _tableSections = tableSections;
    [self didChangeValueForKey:@"tableSections"];
    
    [self reloadData];
    
}

@end

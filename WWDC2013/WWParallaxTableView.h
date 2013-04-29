//
//  WWParallaxTableView.h
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WWTableSection;

@interface WWParallaxTableView : UITableView

@property (nonatomic, weak) UIScrollView *parallaxScrollView;
@property (nonatomic, assign) CGFloat parallaxOffset;

@property (nonatomic, strong) NSArray *tableSections;

@end

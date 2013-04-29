//
//  WWParallaxTableViewCell.h
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWParallaxTableViewCell : UITableViewCell

@property (nonatomic, assign) UITableView *parentTableView;

@property (nonatomic, assign) CGFloat parallaxOffset;

-(void)sharedInit;

-(UIView *)parallaxView;

// returns the height of the table view cell
+(CGFloat)height;

// convenience methods
-(CGFloat)offsetForParallaxOffset:(CGFloat)parallaxOffset betweenOffset:(CGFloat)bottom andOffset:(CGFloat)top;

@end

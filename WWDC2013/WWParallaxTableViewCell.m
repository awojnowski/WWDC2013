//
//  WWParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWParallaxTableViewCell.h"

@implementation WWParallaxTableViewCell

-(id)init {
    
    self = [super init];
    if (self) {
        
        [self sharedInit];
                
    }
    
    return self;
    
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self sharedInit];
        
    }
    
    return self;
    
}

-(void)sharedInit {
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [[self contentView] addSubview:[self parallaxView]];
    
}

#pragma mark - Getters & Setters

-(UIView *)parallaxView {
        
    return [[UIView alloc] init];
    
}

+(CGFloat)height {
    
    static NSMutableDictionary *heights;
    if (!heights) heights = [NSMutableDictionary dictionary];
    
    NSString *className = NSStringFromClass([self class]);
    NSNumber *height = heights[className];
    
    if (!height) {
        
        height = @([[[[[self class] alloc] init] parallaxView] frame].size.height);
        heights[className] = height;
        
    }
    
    return [height floatValue];
    
}

#pragma mark - Convenience Methods

-(CGFloat)offsetForParallaxOffset:(CGFloat)parallaxOffset betweenOffset:(CGFloat)bottom andOffset:(CGFloat)top {
    
    CGFloat offset = 0.0;
    
    if (parallaxOffset <= bottom) offset = 0.0;
    else if (parallaxOffset >= top) offset = 1.0;
    else {
        
        CGFloat pOffset = parallaxOffset - bottom;
        offset = pOffset / (top - bottom);
        
    }
    
    return offset;
    
}

@end

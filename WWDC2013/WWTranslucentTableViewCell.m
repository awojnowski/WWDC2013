//
//  WWTranslucentTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-28.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTranslucentTableViewCell.h"

@implementation WWTranslucentTableViewCell

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
    
    [self setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9]];
    
    [[self textLabel] setBackgroundColor:[UIColor clearColor]];
    
}

#pragma mark - Getters & Setters

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    void (^applyHighlights)(void) = ^{
        
        if (highlighted) [self setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6]];
        else [self setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75]];
        
    };
    
    if (animated) [UIView animateWithDuration:0.5 animations:applyHighlights];
    else applyHighlights();
    
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    void (^applyHighlights)(void) = ^{
        
        if (selected) [self setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6]];
        else [self setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75]];
        
    };
    
    if (animated) [UIView animateWithDuration:0.5 animations:applyHighlights];
    else applyHighlights();
    
}

@end

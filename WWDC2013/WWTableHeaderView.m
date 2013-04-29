//
//  WWTableHeaderView.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTableHeaderView.h"

@interface WWTableHeaderView ()

@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation WWTableHeaderView

-(id)init {
    
    self = [super init];
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.4]];
        
        UILabel *textLabel = [[UILabel alloc] init];
        [textLabel setFrame:CGRectMake(10, 0, 300, 40)];
        [textLabel setText:[self text]];
        [textLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [textLabel setBackgroundColor:[UIColor clearColor]];
        [textLabel setShadowOffset:CGSizeMake(0, 1)];
        [textLabel setShadowColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]];
        [textLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:textLabel];
        [self setTextLabel:textLabel];
        
    }
    
    return self;
    
}

#pragma mark - Getters & Setters

-(void)setText:(NSString *)text {
    
    [self willChangeValueForKey:@"text"];
    _text = text;
    [self didChangeValueForKey:@"text"];
    
    [[self textLabel] setText:text];
    
}

@end

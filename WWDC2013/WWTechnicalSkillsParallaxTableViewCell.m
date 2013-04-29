//
//  WWTechnicalSkillsParallaxTableViewCell.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-26.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTechnicalSkillsParallaxTableViewCell.h"

@interface WWTechnicalSkillsParallaxTableViewCell ()

@property (nonatomic, weak) UIView *staticView;

@property (nonatomic, weak) UILabel *codeLabel;

@end

@implementation WWTechnicalSkillsParallaxTableViewCell {
    
    CGFloat _staticOffset;
    
    NSString *_code;
    
}

-(void)sharedInit {
    
    _staticOffset = NSNotFound;
    
    _code = @"> My first programming language was Objective-C.\n> I design websites with HTML, CSS, and JavaScript.\n> Additionally, I'm familiar with Python and PHP.\n> I've been programming for 3 years.            ";
    
    [super sharedInit];
    
}

-(UIView *)parallaxView {
    
    UIView *parallaxView = [[UIView alloc] init];
    
    UIView *staticView = [[UIView alloc] init];
    [staticView setFrame:CGRectMake(0, 0, 320, 568)];
    [staticView setBackgroundColor:[UIColor clearColor]];
    [parallaxView addSubview:staticView];
    [self setStaticView:staticView];
    
    UIImageView *macintoshSEImageView = [[UIImageView alloc] init];
    [macintoshSEImageView setFrame:CGRectMake(0, 0, 320, 568)];
    [macintoshSEImageView setImage:[UIImage imageNamed:@"macintoshSE@2x"]];
    [staticView addSubview:macintoshSEImageView];
    
    UILabel *codeLabel = [[UILabel alloc] init];
    [codeLabel setFrame:CGRectMake(55, 135, 208, 0)];
    [codeLabel setBackgroundColor:[UIColor blueColor]];
    [codeLabel setTextColor:[UIColor greenColor]];
    [codeLabel setTextAlignment:NSTextAlignmentLeft];
    [codeLabel setFont:[UIFont fontWithName:@"AppleColorEmoji" size:12.0]];
    [codeLabel setNumberOfLines:0];
    [macintoshSEImageView addSubview:codeLabel];
    [self setCodeLabel:codeLabel];
    
    [parallaxView setFrame:CGRectMake(0, 0, 320, 2000)];
    return parallaxView;
    
}

-(void)setParallaxOffset:(CGFloat)parallaxOffset {
    
    CGFloat ourHeight = [[self class] height];
    
    if (_staticOffset == NSNotFound) _staticOffset = [[self parentTableView] frame].size.height / ourHeight;
    
    if (parallaxOffset >= _staticOffset) {
        
        if (parallaxOffset < 1.0) {
            
            CGFloat difference = parallaxOffset - _staticOffset;
            [[self staticView] setTransform:CGAffineTransformMakeTranslation(0, difference * (ourHeight - 25))];
            
            CGFloat staticOffsetBase = 1.0 - _staticOffset;
            CGFloat codeStep = difference / staticOffsetBase;
            
            int substringIndex = round(codeStep * [_code length]);
            if (substringIndex < 1) substringIndex = 1;
            
            [[self codeLabel] setText:[_code substringToIndex:substringIndex]];
            [[self codeLabel] sizeToFit];
            [[self codeLabel] setFrame:CGRectMake(55, 135, 208, [[self codeLabel] frame].size.height)];
            
        }
        
    } else {
        
        [[self staticView] setTransform:CGAffineTransformMakeTranslation(0, 0)];
        [[self codeLabel] setText:[_code substringToIndex:1]];
        
    }
    
}


@end

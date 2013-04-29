//
//  WWBackgroundScrollView.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWBackgroundScrollView.h"

#import "WWBlurredImageView.h"
#import "WWBlurredSlideshowImageView.h"

@interface WWBackgroundScrollView () <UIScrollViewDelegate>

@property (nonatomic, weak) WWBlurredSlideshowImageView *initialSlideshowImageView;

@property (nonatomic, weak) WWBlurredImageView *linenBackgroundImageView;
@property (nonatomic, weak) WWBlurredImageView *winnipegImageView1;
@property (nonatomic, weak) WWBlurredImageView *winnipegImageView2;

@property (nonatomic, weak) UIImageView *woodImageView;

@property (nonatomic, weak) WWBlurredImageView *bubbleImageView;
@property (nonatomic, weak) WWBlurredImageView *classroomImageView;
@property (nonatomic, weak) WWBlurredImageView *keyboardImageView;
@property (nonatomic, weak) WWBlurredImageView *writingImageView;


@end

@implementation WWBackgroundScrollView

-(id)init {
    
    self = [super init];
    if (self) {
        
        [self setDelegate:self];
        
        [self layoutBackgroundContent];
        
    }
    
    return self;
    
}

-(void)layoutBackgroundContent {
    
    [self setBackgroundColor:[UIColor blackColor]];
    
    WWBlurredSlideshowImageView *initialSlideshowImageView = [[WWBlurredSlideshowImageView alloc] init];
    [initialSlideshowImageView setFrame:CGRectMake(0, -100, 320, 800)];
    [initialSlideshowImageView setTag:150];
    [initialSlideshowImageView setImageNames:@[
        @"sanFrancisco@2x",
        @"mosconeWest@2x",
    ]];
    [self addSubview:initialSlideshowImageView];
    [self setInitialSlideshowImageView:initialSlideshowImageView];
    
    WWBlurredImageView *linenBackgroundImageView = [[WWBlurredImageView alloc] init];
    [linenBackgroundImageView setFrame:CGRectMake(0, 150, 320, 800)];
    [linenBackgroundImageView setTag:100];
    [linenBackgroundImageView setImage:[UIImage imageNamed:@"bubbleBackground2@2x"]];
    [self insertSubview:linenBackgroundImageView belowSubview:initialSlideshowImageView];
    [self setLinenBackgroundImageView:linenBackgroundImageView];
    
    WWBlurredImageView *winnipegImageView1 = [[WWBlurredImageView alloc] init];
    [winnipegImageView1 setFrame:CGRectMake(0, 330, 320, 1500)];
    [winnipegImageView1 setTag:150];
    [winnipegImageView1 setImage:[UIImage imageNamed:@"winnipeg1@2x"]];
    [self insertSubview:winnipegImageView1 belowSubview:linenBackgroundImageView];
    [self setWinnipegImageView1:winnipegImageView1];
    
    WWBlurredImageView *winnipegImageView2 = [[WWBlurredImageView alloc] init];
    [winnipegImageView2 setFrame:CGRectMake(0, 900, 320, 1500)];
    [winnipegImageView2 setTag:150];
    [winnipegImageView2 setImage:[UIImage imageNamed:@"winnipeg2@2x"]];
    [self insertSubview:winnipegImageView2 belowSubview:winnipegImageView1];
    [self setWinnipegImageView2:winnipegImageView2];
    
    UIImageView *woodImageView = [[UIImageView alloc] init];
    [woodImageView setFrame:CGRectMake(0, 1400, 320, 1500)];
    [woodImageView setTag:150];
    [woodImageView setImage:[UIImage imageNamed:@"woodBackground@2x"]];
    [self insertSubview:woodImageView belowSubview:winnipegImageView2];
    [self setWoodImageView:woodImageView];
    
    WWBlurredImageView *skyImageView = [[WWBlurredImageView alloc] init];
    [skyImageView setFrame:CGRectMake(0, 2200, 320, 1500)];
    [skyImageView setTag:150];
    [skyImageView setImage:[UIImage imageNamed:@"bubbleBackground1@2x"]];
    [self insertSubview:skyImageView belowSubview:woodImageView];
    [self setBubbleImageView:skyImageView];
    
    WWBlurredImageView *classroomImageView = [[WWBlurredImageView alloc] init];
    [classroomImageView setFrame:CGRectMake(0, 2600, 320, 1300)];
    [classroomImageView setTag:50];
    [classroomImageView setImage:[UIImage imageNamed:@"classroomBackground@2x"]];
    [self insertSubview:classroomImageView belowSubview:skyImageView];
    [self setClassroomImageView:classroomImageView];
    
    WWBlurredImageView *keyboardImageView = [[WWBlurredImageView alloc] init];
    [keyboardImageView setFrame:CGRectMake(0, 3000, 320, 1000)];
    [keyboardImageView setTag:150];
    [keyboardImageView setImage:[UIImage imageNamed:@"keyboardBackground@2x"]];
    [self insertSubview:keyboardImageView belowSubview:classroomImageView];
    [self setKeyboardImageView:keyboardImageView];
    
    WWBlurredImageView *writingImageView = [[WWBlurredImageView alloc] init];
    [writingImageView setFrame:CGRectMake(0, 3300, 320, 1500)];
    [writingImageView setTag:150];
    [writingImageView setImage:[UIImage imageNamed:@"writingBackground@2x"]];
    [self insertSubview:writingImageView belowSubview:keyboardImageView];
    [self setWritingImageView:writingImageView];
        
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat contentOffset = [scrollView contentOffset].y + [scrollView contentSize].height;
    
    static NSDictionary *fadeOffsets;
    if (!fadeOffsets) {
        
        fadeOffsets = @{
                        @1100 : [self initialSlideshowImageView],
                        @1300 : [self linenBackgroundImageView],
                        @1900 : [self winnipegImageView1],
                        @2400 : [self winnipegImageView2],
                        @3200 : [self woodImageView],
                        @3550 : [self bubbleImageView],
                        @4000 : [self classroomImageView],
                        @4300 : [self keyboardImageView]
        };
        
    }
    
    for (NSNumber *key in [fadeOffsets allKeys]) {
        
        CGFloat value = [key floatValue];
        UIView *view = fadeOffsets[key];
        
        if (contentOffset > value) {
            
            CGFloat alpha = 1.0 - ((contentOffset - value) / ([view tag] * 1.0));
            [view setAlpha:alpha];
            
        } else [view setAlpha:1.0];
        
    }
    
}

@end

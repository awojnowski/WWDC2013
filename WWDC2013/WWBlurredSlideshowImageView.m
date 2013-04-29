//
//  WWBlurredSlideshowImageView.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWBlurredSlideshowImageView.h"

@implementation WWBlurredSlideshowImageView {
    
    @private
    NSTimer *_swapTimer;
    
    NSNumber *_lastIndex;
    
}

-(void)dealloc {
    
    [_swapTimer invalidate];
    
}

-(id)init {
    
    self = [super init];
    if (self) {
        
        
        
    }
    
    return self;
    
}

-(void)chooseImage {
    
    _swapTimer = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(chooseImage) userInfo:nil repeats:NO];
    
    UIImageView *overlayImageView = nil;
    
    if ([self image]) {
        
        overlayImageView = [[UIImageView alloc] init];
        [overlayImageView setFrame:[self bounds]];
        [overlayImageView setImage:[self image]];
        [self addSubview:overlayImageView];
        
    }
    
    double (^pickIndex)(void) = ^{
        
        double random = arc4random() % [_imageNames count];
        return floor(random);
        
    };
    
    int index = pickIndex();
    
    if (_lastIndex) {
        
        while (index == [_lastIndex intValue]) {
            
            index = pickIndex();
            
        }
        
    }
        
    _lastIndex = @(index);
    
    UIImage *image = [UIImage imageNamed:_imageNames[index]];
    [self setImage:image];
    
    if (overlayImageView) {
        
        [UIView animateWithDuration:1.0 animations:^{
            
            [overlayImageView setAlpha:0.0];
            
        } completion:^(BOOL finished) {
            
            [overlayImageView removeFromSuperview];
            
        }];
        
    }
    
}

-(void)setImageNames:(NSArray *)imageNames {
    
    [self willChangeValueForKey:@"imageNames"];
    _imageNames = imageNames;
    [self didChangeValueForKey:@"imageNames"];
    
    [self chooseImage];
    
}

@end

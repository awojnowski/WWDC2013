//
//  WWBlurredImageView.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-25.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWBlurredImageView.h"

#import <CoreImage/CoreImage.h>

@implementation WWBlurredImageView

-(void)setImage:(UIImage *)image {
    
    if (!image) {
        
        [self setImage:image];
        return;
        
    }
    
    CIImage *initialImage = [[CIImage alloc] initWithImage:image];
    
    CIContext *coreImageContext = [CIContext contextWithOptions:nil];
    
    CIFilter *coreImageFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [coreImageFilter setValue:initialImage forKey:kCIInputImageKey];
    
    CIImage *outputImage = [coreImageFilter outputImage];
    
    CGImageRef imageRef = [coreImageContext createCGImage:outputImage fromRect:CGRectMake(0, 0, [image size].width, [image size].height)];
    image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    [super setImage:image];
    
}

@end

//
//  WWIphoneView.h
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-27.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WWIphoneApplication, WWIphoneView;

@protocol WWIphoneViewDelegate <NSObject>

-(void)iPhoneView:(WWIphoneView *)iphoneView didTapApplication:(WWIphoneApplication *)application;

@end

@interface WWIphoneView : UIView

@property (nonatomic, weak) id <WWIphoneViewDelegate> delegate;

@property (nonatomic, strong) NSArray *applications;

@end

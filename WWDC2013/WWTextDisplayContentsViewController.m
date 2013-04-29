//
//  WWTextDisplayContentsViewController.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-28.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTextDisplayContentsViewController.h"

@interface WWTextDisplayContentsViewController ()

@property (nonatomic, weak) UITextView *textView;

@end

@implementation WWTextDisplayContentsViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    
    [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)]];
    
    UITextView *textView = [[UITextView alloc] init];
    [textView setFrame:CGRectMake(20, 0, 280, [[UIScreen mainScreen] bounds].size.height - 44)];
    [textView setBackgroundColor:[UIColor clearColor]];
    [textView setContentInset:UIEdgeInsetsMake(18, 0, 20, 0)];
    [textView setTextColor:[UIColor darkGrayColor]];
    [textView setFont:[UIFont systemFontOfSize:16.0]];
    [textView setEditable:NO];
    [textView setDataDetectorTypes:UIDataDetectorTypeLink];
    [textView setText:[self text]];
    [[self view] addSubview:textView];
    [self setTextView:textView];
    
}

#pragma mark - Actions

-(void)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Getters & Setters

-(void)setText:(NSString *)text {
    
    [self willChangeValueForKey:@"text"];
    _text = text;
    [self didChangeValueForKey:@"text"];
    
    [[self textView] setText:text];
    
}

@end

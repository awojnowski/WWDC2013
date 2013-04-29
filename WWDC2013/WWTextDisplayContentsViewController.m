//
//  WWTextDisplayContentsViewController.m
//  WWDC2013
//
//  Created by Aaron Wojnowski on 2013-04-28.
//  Copyright (c) 2013 Aaron Wojnowski. All rights reserved.
//

#import "WWTextDisplayContentsViewController.h"

@interface WWTextDisplayContentsViewController () <UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation WWTextDisplayContentsViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor darkGrayColor]];
    
    [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)]];
    
    UIWebView *webView = [[UIWebView alloc] init];
    [webView setFrame:CGRectMake(0, 0, 320, [[UIScreen mainScreen] bounds].size.height - 44)];
    [webView setDelegate:self];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setDataDetectorTypes:UIDataDetectorTypeLink];
    [[self view] addSubview:webView];
    [self setWebView:webView];
    
    [self loadTextIntoWebView];
    
}

#pragma mark - Actions

-(void)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - HTML Helper Methods

-(NSString *)htmlStringFromText:(NSString *)text {
    
    return [@"<style>body{width:270px;padding:20px;font-size:18px;color:#666;font-family:Helvetica,Arial;}</style><body>" stringByAppendingString:text];
    
}

-(void)loadTextIntoWebView {
    
    [[self webView] loadHTMLString:[self htmlStringFromText:[self text]] baseURL:nil];
    
}

#pragma mark - UIWebViewDelegate

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *urlString = [[request URL] absoluteString];
    if (![urlString isEqualToString:@"about:blank"]) {
        
        [[UIApplication sharedApplication] openURL:[request URL]];
        
        return NO;
        
    }
    
    return YES;
    
}

#pragma mark - Getters & Setters

-(void)setText:(NSString *)text {
    
    [self willChangeValueForKey:@"text"];
    _text = text;
    [self didChangeValueForKey:@"text"];
    
    [self loadTextIntoWebView];
    
}

@end

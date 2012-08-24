//
//  ViewController.m
//  Raymark Browser
//
//  Created by Simon Zhou on 12-08-24.
//  Copyright (c) 2012 Raymark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void)loadURL:(NSString*)urlString;
- (void)updateButtonsState;
@end

@implementation ViewController
@synthesize urlTextField;
@synthesize webView;
@synthesize btnForward;
@synthesize btnBack;
@synthesize btnStop;
@synthesize btnRefresh;

static NSString* initialURL=@"http://www.google.com";

- (void)loadURL:(NSString*)urlString{
    if(urlString.length>0){
        NSString* validURLString = urlString;
        if(![[[urlString substringToIndex:4] lowercaseString] isEqualToString:@"http"]){
            validURLString = [NSString stringWithFormat:@"http://%@", urlString];
        }
        NSURL *url = [NSURL URLWithString:validURLString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}

- (void)updateButtonsState{
    self.btnBack.enabled = self.webView.canGoBack;
    self.btnForward.enabled = self.webView.canGoForward;
    self.btnRefresh.enabled = !self.webView.loading;
    self.btnStop.enabled = self.webView.loading;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadURL:initialURL];
}

- (void)viewDidUnload
{
    [self setUrlTextField:nil];
    [self setWebView:nil];
    [self setBtnForward:nil];
    [self setBtnBack:nil];
    [self setBtnStop:nil];
    [self setBtnRefresh:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)btnGoClicked:(id)sender {
    NSString *urlString = self.urlTextField.text;
    [self.urlTextField resignFirstResponder];
    [self loadURL:urlString];
}

- (IBAction)btnBackClicked:(id)sender {
    [self.webView goBack];
}

- (IBAction)btnForwardClicked:(id)sender {
    [self.webView goForward];
}

- (IBAction)btnStopClicked:(id)sender {
    [self.webView stopLoading];
}

- (IBAction)btnRefreshClicked:(id)sender {
    [self.webView reload];
}

#pragma UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self updateButtonsState];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtonsState];
    self.urlTextField.text = self.webView.request.URL.absoluteString;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtonsState];
}

#pragma UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSString *urlString = self.urlTextField.text;
    [self loadURL:urlString];
}

@end

























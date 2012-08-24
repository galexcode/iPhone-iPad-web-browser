//
//  ViewController.h
//  Raymark Browser
//
//  Created by Simon Zhou on 12-08-24.
//  Copyright (c) 2012 Raymark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnForward;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnStop;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnRefresh;


- (IBAction)btnGoClicked:(id)sender;
- (IBAction)btnBackClicked:(id)sender;
- (IBAction)btnForwardClicked:(id)sender;
- (IBAction)btnStopClicked:(id)sender;
- (IBAction)btnRefreshClicked:(id)sender;
@end

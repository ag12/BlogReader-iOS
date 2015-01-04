//
//  AMWebViewController.h
//  BlogReader
//
//  Created by Amir Ghoreshi on 04/01/15.
//  Copyright (c) 2015 AM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMWebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

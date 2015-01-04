//
//  AMWebViewController.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 04/01/15.
//  Copyright (c) 2015 AM. All rights reserved.
//

#import "AMWebViewController.h"

@implementation AMWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://blog.teamtreehouse.com"];
    NSURLRequest *reg = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:reg];

}
@end

//
//  AMDataSource.h
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableViewController.h> 

@interface AMDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>
- (instancetype)initWithData:(NSArray *)data;
@property (nonatomic, strong) NSArray *data;

@end

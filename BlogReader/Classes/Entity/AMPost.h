//
//  AMPost.h
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import <Mantle.h>

@interface AMPost : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *pid;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSURL *thumbnailURL;

@end

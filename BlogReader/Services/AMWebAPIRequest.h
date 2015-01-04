//
//  AMWebAPIRequest.h
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMWebAPIClient.h"

typedef void (^WebAPISuccess)(id responseObject);
typedef void (^WebAPIFailure)(NSError *error, NSInteger statusCode);

@interface AMWebAPIRequest : NSObject

@property (nonatomic, weak) AMWebAPIClient *client;
@property (nonatomic, strong) NSString *path;

- (instancetype)initWithPath:(NSString *)path;
- (void)executeInBackground:(WebAPISuccess)success failure:(WebAPIFailure)failure;
@end

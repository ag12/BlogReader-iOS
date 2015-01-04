//
//  AMWebAPIGet.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMWebAPIGet.h"

@implementation AMWebAPIGet

- (void)executeInBackground:(WebAPISuccess)success failure:(WebAPIFailure)failure {

    [self.client getInBackground:self.path success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error, error.code);
    }];
}
@end

//
//  AMWebAPIClient.h
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void (^SuccessOperation)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^FailureOperation)(AFHTTPRequestOperation *operation, NSError *error);


@interface AMWebAPIClient : AFHTTPRequestOperationManager

+ (AMWebAPIClient *)sharedClient;
- (void)getInBackground:(NSString *)path success:(SuccessOperation)success failure:(FailureOperation)failure;

@end

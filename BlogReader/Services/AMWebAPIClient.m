//
//  AMWebAPIClient.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMWebAPIClient.h"

@implementation AMWebAPIClient

#pragma mark - Static

+ (AMWebAPIClient *)sharedClient {
    static AMWebAPIClient *_sharedClient = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        _sharedClient = [AMWebAPIClient new];
    });
    return _sharedClient;
}

#pragma mark - Init

- (instancetype)init {
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://blog.teamtreehouse.com/api/"]];
    if (self) {
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    }
    return self;
}

- (void)requestInBackground:(NSString *)path method:(NSString *)method success:(SuccessOperation)success failure:(FailureOperation)failure {

    NSError *error = nil;
    NSURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:path relativeToURL:self.baseURL] absoluteString] parameters:nil error:&error];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self.operationQueue addOperation:operation];

}
- (void)getInBackground:(NSString *)path success:(SuccessOperation)success failure:(FailureOperation)failure {
    [self requestInBackground:path method:@"GET" success:success failure:failure];
}
@end

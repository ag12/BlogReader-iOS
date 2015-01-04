//
//  AMWebAPIRequest.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMWebAPIRequest.h"

@implementation AMWebAPIRequest

- (instancetype)initWithPath:(NSString *)path {
    if (self = [super init]) {
        [self setClient:[AMWebAPIClient sharedClient]];
        [self setPath:path];
    }
    return self;
}

- (void)executeInBackground:(WebAPISuccess)success failure:(WebAPIFailure)failure {
    @throw [NSException exceptionWithName:@"NotImplementedException" reason:@"No reason" userInfo:nil];
}
@end

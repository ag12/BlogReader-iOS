//
//  AMPostManager.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMPostManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AMPost.h"

@implementation AMPostManager

- (NSArray *)postTransformer:(NSDictionary *)posts {

    RACSequence *list = [posts rac_sequence];
    return [[list map:^(NSDictionary *item) {
        return [MTLJSONAdapter modelOfClass:[AMPost class] fromJSONDictionary:item error:nil];
    }] array];

}

- (void)fetchPostInBackground:(FetchPostSuccess)success failure:(WebAPIFailure)failure {
    AMWebAPIGet *getApi = [[AMWebAPIGet alloc] initWithPath:@"get_recent_summary/"];
    [getApi executeInBackground:^(id responseObject) {
        NSArray *posts = [self postTransformer:(NSDictionary *)[responseObject objectForKey:@"posts"]];
        success(posts);
    } failure:^(NSError *error, NSInteger statusCode) {
        failure(error, statusCode);
    }];
}
@end

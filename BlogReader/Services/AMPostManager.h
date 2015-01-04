//
//  AMPostManager.h
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMWebAPIGet.h"

typedef void (^FetchPostSuccess)(NSArray *posts);

@interface AMPostManager : NSObject
- (void)fetchPostInBackground:(FetchPostSuccess)success failure:(WebAPIFailure)failure;
@end

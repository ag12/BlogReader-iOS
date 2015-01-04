//
//  AMPost.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMPost.h"

@implementation AMPost

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"pid": @"id",
             @"url": @"url",
             @"title": @"title",
             @"date": @"date",
             @"author": @"author",
             @"thumbnailURL": @"thumbnail",
             };
}

+ (NSValueTransformer *)dateJSONTransformer {

    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^(NSString *string) {
                NSDate *date = [[self dateFormatter:@"yyyy-MM-dd HH:mm:ss"] dateFromString:string];
                return [[self dateFormatter:@"EE MMM, dd"] stringFromDate:date];
            }
            reverseBlock:^(NSDate *date) {
                return [[self dateFormatter:@"EE MMM, dd"] stringFromDate:date];
            }];
}
+ (NSValueTransformer *)urlJSONTransformer {
    return [self urlTransformer];
}
+ (NSValueTransformer *)thumbnailURLJSONTransformer {
    return [self urlTransformer];
}
+ (NSValueTransformer *)urlTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}
+ (NSDateFormatter *)dateFormatter:(NSString *)format {

    static NSDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        formatter.locale = [NSLocale currentLocale];
    });
    formatter.dateFormat = format;
    return formatter;
}
@end

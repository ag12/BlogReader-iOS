//
//  AMDataSource.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//
//
//  The datasource and TableViewDataSource methods

#import "AMDataSource.h"
#import "AMDataViewCell.h"
#import "AMPost.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import "RACEXTScope.h"


@implementation AMDataSource

- (instancetype)initWithData:(NSArray *)data {
    if (self = [super init]) {
        _data = data;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"SourceCell";
    AMDataViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    AMPost *post = self.data[indexPath.row];
    cell.title.text = [post title];
    cell.subTitle.text = [NSString stringWithFormat:@"%@ - %@",[post author],[post date]];
    LogTrace(@"%@", [post.date isKindOfClass:[NSDate class]] ? @"YES" : @"NO");
    LogTrace(@"%@", post);
    if (post.thumbnailURL != nil) {
        @weakify(cell);
        [cell.thumbnail setImageWithURLRequest:[NSURLRequest requestWithURL:[post thumbnailURL]] placeholderImage:cell.thumbnail.image success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        @strongify(cell);
            cell.thumbnail.image = image;
            [cell setNeedsLayout];
        }
        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        }];
    }
    return cell;
}


@end

//
//  AMViewController.m
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import "AMViewController.h"
#import "AMDataSource.h"
#import "AMDataViewCell.h"
#import "AMPostManager.h"
#import "RACEXTScope.h"
#import "AMPost.h"

@interface AMViewController ()

@property (nonatomic, strong) AMDataSource *dataSource;
@end

@implementation AMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self);
    [[AMPostManager new] fetchPostInBackground:^(NSArray *posts) {
        @strongify(self);
        [self didFetchPostInBackgroundSuccess:posts];
    } failure:^(NSError *error, NSInteger statusCode) {
        @strongify(self);
        [self erro:error statusCode:statusCode];
    }];
}

- (void)didFetchPostInBackgroundSuccess:(NSArray *)posts {
    self.dataSource = [[AMDataSource alloc] initWithData:posts];
    self.tableView.dataSource = self.dataSource;
    [self.tableView reloadData];
}
- (void)erro:(NSError *)error statusCode:(NSInteger)statusCode {
    LogTrace(@"%@", error.debugDescription);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LogTrace(@"dfsfs %@", segue.identifier);

    if ([segue.identifier isEqualToString:@"showWebSegue"]) {

    }

}
@end

//
//  AMDataViewCell.h
//  BlogReader
//
//  Created by Amir Ghoreshi on 29/12/14.
//  Copyright (c) 2014 AM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMDataViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *subTitle;

@end

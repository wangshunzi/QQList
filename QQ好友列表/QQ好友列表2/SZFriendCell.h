//
//  SZFriendCell.h
//  QQ好友列表2
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZFriend.h"
@interface SZFriendCell : UITableViewCell
@property (nonatomic, strong) SZFriend *friendData;

+ (instancetype)cellWithTableView : (UITableView *)tableView;

@end

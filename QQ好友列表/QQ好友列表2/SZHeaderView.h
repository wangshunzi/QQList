//
//  SZHeaderView.h
//  QQ好友列表2
//
//  Created by mac on 14-4-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZFriendGroup.h"
@class SZHeaderView;
@protocol SZHeaderViewDelegate <NSObject>
@optional
- (void)headerViewDidClick : (SZHeaderView *)headerView;


@end

@interface SZHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) SZFriendGroup *group;

@property (nonatomic, weak) id<SZHeaderViewDelegate> delegate;

+ (instancetype)headerViewWithtableView : (UITableView *)tableView;

@end

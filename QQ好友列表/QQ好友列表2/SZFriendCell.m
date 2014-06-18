//
//  SZFriendCell.m
//  QQ好友列表2
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SZFriendCell.h"

@implementation SZFriendCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend";
    SZFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SZFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
    
}

- (void)setFriendData:(SZFriend *)friendData
{
    
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.detailTextLabel.text = friendData.intro;
    if (friendData.vip) {
        self.textLabel.textColor = [UIColor redColor];
    }


}

@end

//
//  SZFriendGroup.h
//  QQ好友列表2
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SZFriend.h"
@interface SZFriendGroup : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, assign, getter = isShow) BOOL show;

+ (instancetype)friendGroupWithDic : (NSDictionary *)dic;
- (instancetype)initWithDic : (NSDictionary *)dic;

@end

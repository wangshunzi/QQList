//
//  SZFriend.h
//  QQ好友列表2
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SZFriend : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign, getter = isVip) BOOL vip;

+ (instancetype)friendWithDic : (NSDictionary *)dic;
- (instancetype)initWithDic : (NSDictionary *)dic;

@end

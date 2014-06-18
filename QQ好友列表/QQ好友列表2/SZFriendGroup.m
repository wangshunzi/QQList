//
//  SZFriendGroup.m
//  QQ好友列表2
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SZFriendGroup.h"

@implementation SZFriendGroup

+ (instancetype)friendGroupWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
        
        NSMutableArray *friends = [NSMutableArray array];
        for (NSDictionary *item in self.friends) {
            SZFriend *friend = [SZFriend friendWithDic : item];
            [friends addObject:friend];
        }
        
        self.friends = friends;
    }
    
    return self;
    
}
@end

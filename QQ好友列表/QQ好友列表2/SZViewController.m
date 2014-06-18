//
//  SZViewController.m
//  QQ好友列表2
//
//  Created by mac on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SZViewController.h"
#import "SZFriendGroup.h"
#import "SZFriendCell.h"
#import "SZHeaderView.h"
@interface SZViewController ()<SZHeaderViewDelegate>

@property (nonatomic, strong) NSArray *friendGroups;

@end

@implementation SZViewController


-(void)headerViewDidClick:(id)headerView
{
    [self.tableView reloadData];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (NSArray *)friendGroups
{
    if (_friendGroups == nil) {
     

        NSArray *fgs = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"]];
        
        NSMutableArray *friendGroups = [NSMutableArray array];
        for (NSDictionary *fg in fgs) {
            SZFriendGroup *friendGroup = [SZFriendGroup friendGroupWithDic:fg];
            [friendGroups addObject:friendGroup];
        }
        _friendGroups = friendGroups;
    }
    return _friendGroups;
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
	self.tableView.sectionHeaderHeight = 44;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return self.friendGroups.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SZFriendGroup *group = self.friendGroups[section];
    if (group.isShow) {
        return group.friends.count;
    }
    else
    {
        return 0;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SZFriendCell *cell = [SZFriendCell cellWithTableView:tableView];
    SZFriendGroup *fg = self.friendGroups[indexPath.section];
    SZFriend *friend = fg.friends[indexPath.row];
    cell.friendData = friend;
    
    return cell;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SZHeaderView *header = [SZHeaderView headerViewWithtableView:tableView];
    
    header.group = self.friendGroups[section];
    header.delegate = self;
    
    return header;
}



@end

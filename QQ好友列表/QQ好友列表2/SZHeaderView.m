//
//  SZHeaderView.m
//  QQ好友列表2
//
//  Created by mac on 14-4-4.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SZHeaderView.h"

@interface SZHeaderView()

@property (nonatomic, weak) UIButton *backBtn;
@property (nonatomic, weak) UILabel *name;

@end


@implementation SZHeaderView


-(id)initWithFrame:(CGRect)frame
{
   return  [super initWithFrame:frame];
    NSLog(@"test");
}

-(id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        UIButton *backBtn = [[UIButton alloc] init];
        [backBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        backBtn.imageView.contentMode = UIViewContentModeCenter;
        backBtn.imageView.clipsToBounds = NO;
        
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [backBtn addTarget:self action:@selector(isShow) forControlEvents:UIControlEventTouchUpInside];
        
        self.backBtn = backBtn;
        [self addSubview:backBtn];
        
        UILabel *name = [[UILabel alloc] init];
        name.textColor = [UIColor grayColor];
        name.textAlignment = NSTextAlignmentRight;
        self.name = name;
        [self addSubview:name];
    }
    
    return self;
}

- (void)isShow
{
    self.group.show = !self.group.isShow;
    if ([self.delegate respondsToSelector:@selector(headerViewDidClick:)])
    {
        [self.delegate headerViewDidClick:self];
    }
    
}

+ (instancetype)headerViewWithtableView : (UITableView *)tableView
{
    static NSString *ID = @"header";
    SZHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[self alloc] initWithReuseIdentifier:ID];
    }
    
    
    return header;
    
}

-(void)setGroup:(SZFriendGroup *)group
{
    _group = group;
    [self.backBtn setTitle:group.name forState:UIControlStateNormal];
    self.name.text =[NSString stringWithFormat:@"%@/%d",group.online,group.friends.count];
    
    
//    self.backBtn.frame = self.bounds;
//    NSLog(@"%@",NSStringFromCGRect(self.backBtn.frame));
//    CGFloat headerH = self.frame.size.height;
//    CGFloat headerW = self.frame.size.width;
//    self.name.frame = CGRectMake(headerW - 150 - 10, 0, 150, headerH);

    
}

/**
 *  因为,在初始化时,self的frame为0,所以,无法设置子空间的frame,当前frame发生改变时调用
 */
-(void)layoutSubviews
{

    self.backBtn.frame = self.bounds;
    CGFloat headerH = self.frame.size.height;
    CGFloat headerW = self.frame.size.width;
    self.name.frame = CGRectMake(headerW - 150 - 10, 0, 150, headerH);
    
}
/**
 *  因为刷新表格会重新创建数据,所以,需要在刷新后来设置相关操作,
 */
-(void)didMoveToSuperview
{
    if (self.group.isShow) {
        self.backBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

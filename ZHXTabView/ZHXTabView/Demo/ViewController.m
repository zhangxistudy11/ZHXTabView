//
//  ViewController.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/4/26.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ViewController.h"
#import "ZHXTabView.h"

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{
    UITableView  * _tableView;
}
@property (nonatomic, strong) ZHXTabView *firstTabView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ZHXTabView";
    self.view.backgroundColor = [UIColor whiteColor];

    [self setUpView];
}

- (void)setUpView {
    NSArray *titles = @[@"欧洲",@"亚洲",@"大洋洲",@"北美洲"];
    self.firstTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.firstTabView];
    self.firstTabView.frame = CGRectMake(20, 200, ScreenWidth -40, 60);
    
    self.firstTabView.leftPadding = 10;
    self.firstTabView.rightPadding = 10;
    
    self.firstTabView.itemLineColor = [UIColor blueColor];
    self.firstTabView.itemSelectedTextColor = [UIColor blueColor];
    
    UILabel *hotBadge = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    hotBadge.backgroundColor = [UIColor redColor];
    hotBadge.textAlignment = NSTextAlignmentCenter;
    hotBadge.font = [UIFont systemFontOfSize:10];
    hotBadge.layer.cornerRadius = 7.5;
    hotBadge.clipsToBounds = YES;
    hotBadge.text = @"3";
    hotBadge.textColor = [UIColor whiteColor];
    
    [self.firstTabView setBadge:hotBadge atIndex:2 badgeSize:CGSizeMake(15, 15) topOffsetFromTextTop:-6 rightOffsetFormTextRight:-6];
    
}


@end

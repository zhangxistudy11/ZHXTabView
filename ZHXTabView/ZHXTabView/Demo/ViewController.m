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
    NSArray *titles = @[@"Asian",@"Europe",@"Antarctica",@"Africa"];
    self.firstTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.firstTabView];
    self.firstTabView.frame = CGRectMake(20, 150, ScreenWidth -40, 50);
    self.firstTabView.backgroundColor = [UIColor whiteColor];
    
    self.firstTabView.leftPadding = 10;
    self.firstTabView.rightPadding = 10;
    self.firstTabView.itemLineColor = [UIColor blueColor];
    self.firstTabView.itemSelectedTextColor = [UIColor blueColor];
    
    
    
    ZHXBadgeView *badgeOne = [[ZHXBadgeView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    UILabel *hotBadge = [[UILabel alloc]initWithFrame:badgeOne.bounds];
    [badgeOne addSubview:hotBadge];
    hotBadge.backgroundColor = [UIColor redColor];
    hotBadge.textAlignment = NSTextAlignmentCenter;
    hotBadge.font = [UIFont systemFontOfSize:10];
    hotBadge.layer.cornerRadius = 7.5;
    hotBadge.clipsToBounds = YES;
    hotBadge.text = @"3";
    hotBadge.textColor = [UIColor whiteColor];
    
    [self.firstTabView configBadge:badgeOne atIndex:2 badgeSize:CGSizeMake(15, 15) topOffsetFromTextTop:-7 rightOffsetFormTextRight:-11];
    
    ZHXBadgeView *badgeTwo = [[ZHXBadgeView alloc]initWithFrame:CGRectMake(0, 0, 25, 12)];
    UILabel *recBadge = [[UILabel alloc]initWithFrame:badgeTwo.bounds];
    [badgeTwo addSubview:recBadge];
    recBadge.backgroundColor = [UIColor orangeColor];
    recBadge.textAlignment = NSTextAlignmentCenter;
    recBadge.font = [UIFont systemFontOfSize:9];
    recBadge.clipsToBounds = YES;
    recBadge.text = @"hot";
    recBadge.textColor = [UIColor whiteColor];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 25, 12) byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 25, 12);
    shapeLayer.path = path.CGPath;
    recBadge.layer.mask = shapeLayer;
    
    [self.firstTabView configBadge:badgeTwo atIndex:3 badgeSize:CGSizeMake(25, 12) topOffsetFromTextTop:-7 rightOffsetFormTextRight:-10];
    
//    [self.firstTabView configBadgeHide:NO atIndex:2];
    
}


@end

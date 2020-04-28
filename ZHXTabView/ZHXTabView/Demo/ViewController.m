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

@interface ViewController ()<ZHXTabViewDelegate>
{
    UITableView  * _tableView;
}
@property (nonatomic, strong) ZHXTabView *firstTabView;
@property (nonatomic, strong) UILabel *firstTitleLB;
@property (nonatomic, strong) UILabel *firstResultLB;
@property (nonatomic, strong) UILabel *firstIndexLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ZHXTabView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addFirstDemo];
}

- (void)addFirstDemo {
    NSArray *titles = @[@"Asian",@"Europe",@"Antarctica",@"Africa"];
    self.firstTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.firstTabView];
    self.firstTabView.frame = CGRectMake(20, 150, ScreenWidth -40, 50);
    self.firstTabView.backgroundColor = [UIColor whiteColor];
    self.firstTabView.delegate = self;
    
    self.firstTabView.leftPadding = 10;
    self.firstTabView.rightPadding = 10;
    self.firstTabView.itemLineColor = [UIColor blueColor];
    self.firstTabView.itemSelectedTextColor = [UIColor blueColor];
    
    self.firstTitleLB = [[UILabel alloc]initWithFrame:CGRectMake(40, 100, self.firstTabView.frame.size.width-65, 60)];
    [self.view addSubview:self.firstResultLB];
    self.firstResultLB.textAlignment = NSTextAlignmentRight;
    self.firstResultLB.font = [UIFont systemFontOfSize:14];
    self.firstResultLB.textColor = [UIColor blackColor];
    self.firstResultLB.backgroundColor = [UIColor lightGrayColor];
    self.firstResultLB.text = @"The location index you currently selected is : ";
    
    self.firstResultLB = [[UILabel alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(self.firstTabView.frame)+30, self.firstTabView.frame.size.width-65, 60)];
    [self.view addSubview:self.firstResultLB];
    self.firstResultLB.textAlignment = NSTextAlignmentRight;
    self.firstResultLB.font = [UIFont systemFontOfSize:14];
    self.firstResultLB.textColor = [UIColor blackColor];
    self.firstResultLB.backgroundColor = [UIColor lightGrayColor];
    self.firstResultLB.text = @"The location index you currently selected is : ";
    
    
    self.firstIndexLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.firstResultLB.frame), CGRectGetMaxY(self.firstTabView.frame)+30, 35, 60)];
    [self.view addSubview:self.firstIndexLB];
    self.firstIndexLB.textAlignment = NSTextAlignmentLeft;
    self.firstIndexLB.font = [UIFont boldSystemFontOfSize:20];
    self.firstIndexLB.textColor = [UIColor redColor];
    self.firstIndexLB.backgroundColor = [UIColor lightGrayColor];
    self.firstIndexLB.text = [NSString stringWithFormat:@"%d",0];
    
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
#pragma mark - ZHXTabViewDelegate
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
    if (tabView == self.firstTabView) {
        self.firstIndexLB.text = [NSString stringWithFormat:@"%ld",(long)index];
        
    }
}

@end

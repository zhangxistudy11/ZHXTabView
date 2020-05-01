//
//  DemoTwoViewController.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/5/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "DemoTwoViewController.h"
#import "ZHXTabView.h"

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height
@interface DemoTwoViewController ()<ZHXTabViewDelegate>
@property (nonatomic, strong) ZHXTabView *secondTabView;
@property (nonatomic, strong) UILabel *secondTitleLB;
@property (nonatomic, strong) UILabel *secondResultLB;
@property (nonatomic, strong) UILabel *secondIndexLB;
@property (nonatomic, strong) NSArray *secondArray;
@end

@implementation DemoTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Basic Usage";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addSecondDemo];
}
- (void)addSecondDemo {
    self.secondArray = @[@"男装",@"女装",@"童装",@"工装"];
    self.secondTabView = [[ZHXTabView alloc]initWithTitles:self.secondArray];
    [self.view addSubview:self.secondTabView];
    self.secondTabView.frame = CGRectMake(20, 350, ScreenWidth -40, 50);
    self.secondTabView.backgroundColor = [UIColor lightGrayColor];
    self.secondTabView.delegate = self;
    
    self.secondTabView.leftPadding = 10;
    self.secondTabView.rightPadding = 10;
    self.secondTabView.itemLineColor = [UIColor blueColor];
    self.secondTabView.itemSelectedTextColor = [UIColor blueColor];
    
    self.secondTitleLB = [[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMinY(self.secondTabView.frame)-60, ScreenWidth -40, 60)];
    [self.view addSubview:self.secondTitleLB];
    self.secondTitleLB.textAlignment = NSTextAlignmentLeft;
    self.secondTitleLB.font = [UIFont boldSystemFontOfSize:18];
    self.secondTitleLB.textColor = [UIColor blackColor];
    self.secondTitleLB.text = @"2、Custom Badge Demo";
    
    self.secondResultLB = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.secondTabView.frame)+10, 180, 60)];
    [self.view addSubview:self.secondResultLB];
    self.secondResultLB.textAlignment = NSTextAlignmentLeft;
    self.secondResultLB.font = [UIFont systemFontOfSize:14];
    self.secondResultLB.textColor = [UIColor blackColor];
    self.secondResultLB.text = [NSString stringWithFormat:@"您选择的服装类型是: "];
    
    
    self.secondIndexLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.secondResultLB.frame), CGRectGetMaxY(self.secondTabView.frame)+10, 120, 60)];
    [self.view addSubview:self.secondIndexLB];
    self.secondIndexLB.textAlignment = NSTextAlignmentLeft;
    self.secondIndexLB.font = [UIFont boldSystemFontOfSize:20];
    self.secondIndexLB.textColor = [UIColor redColor];
    self.secondIndexLB.text = [NSString stringWithFormat:@"%@",[self.secondArray objectAtIndex:0]];
    
    ZHXBadgeView *badgeOne = [[ZHXBadgeView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    UILabel *hotBadge = [[UILabel alloc]initWithFrame:badgeOne.bounds];
    [badgeOne addSubview:hotBadge];
    hotBadge.backgroundColor = [UIColor redColor];
    hotBadge.textAlignment = NSTextAlignmentCenter;
    hotBadge.font = [UIFont systemFontOfSize:10];
    hotBadge.layer.cornerRadius = 7.5;
    hotBadge.clipsToBounds = YES;
    hotBadge.text = @"2";
    hotBadge.textColor = [UIColor whiteColor];
    
    [self.secondTabView configBadge:badgeOne atIndex:1 badgeSize:CGSizeMake(15, 15) topOffsetFromTextTop:-10 rightOffsetFormTextRight:-8];
    
    ZHXBadgeView *badgeTwo = [[ZHXBadgeView alloc]initWithFrame:CGRectMake(0, 0, 25, 12)];
    UILabel *recBadge = [[UILabel alloc]initWithFrame:badgeTwo.bounds];
    [badgeTwo addSubview:recBadge];
    recBadge.backgroundColor = [UIColor orangeColor];
    recBadge.textAlignment = NSTextAlignmentCenter;
    recBadge.font = [UIFont systemFontOfSize:9];
    recBadge.clipsToBounds = YES;
    recBadge.text = @"sale";
    recBadge.textColor = [UIColor whiteColor];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 25, 12) byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomRight | UIRectCornerTopRight) cornerRadii:CGSizeMake(6, 6)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, 25, 12);
    shapeLayer.path = path.CGPath;
    recBadge.layer.mask = shapeLayer;
    
    [self.secondTabView configBadge:badgeTwo atIndex:3 badgeSize:CGSizeMake(25, 12) topOffsetFromTextTop:-10 rightOffsetFormTextRight:-10];
    
}
#pragma mark - ZHXTabViewDelegate
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
    if (tabView == self.secondTabView){
        self.secondIndexLB.text = [NSString stringWithFormat:@"%@",[self.secondArray objectAtIndex:index]];
    }
}

@end

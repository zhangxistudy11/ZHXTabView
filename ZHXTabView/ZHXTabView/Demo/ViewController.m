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


@property (nonatomic, strong) ZHXTabView *secondTabView;
@property (nonatomic, strong) UILabel *secondTitleLB;
@property (nonatomic, strong) UILabel *secondResultLB;
@property (nonatomic, strong) UILabel *secondIndexLB;
@property (nonatomic, strong) NSArray *secondArray;


@property (nonatomic, strong) ZHXTabView *thirdTabView;
@property (nonatomic, strong) UILabel *thirdTitleLB;
@property (nonatomic, strong) UILabel *thirdResultLB;
@property (nonatomic, strong) UILabel *thirdIndexLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"ZHXTabView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addFirstDemo];
    [self addSecondDemo];
    [self addThirdDemo];
}
- (void)addFirstDemo{
    NSArray *titles = @[@"Asian",@"Europe",@"Antarctica",@"Africa"];
    self.firstTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.firstTabView];
    self.firstTabView.frame = CGRectMake(20, 150, ScreenWidth -40, 50);
    self.firstTabView.backgroundColor = [UIColor cyanColor];
    self.firstTabView.delegate = self;
    
    self.firstTabView.leftPadding = 10;
    self.firstTabView.rightPadding = 10;
    self.firstTabView.itemLineColor = [UIColor blueColor];
    self.firstTabView.itemSelectedTextColor = [UIColor blueColor];
    
    self.firstTitleLB = [[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMinY(self.firstTabView.frame)-60, ScreenWidth -40, 60)];
    [self.view addSubview:self.firstTitleLB];
    self.firstTitleLB.textAlignment = NSTextAlignmentLeft;
    self.firstTitleLB.font = [UIFont boldSystemFontOfSize:18];
    self.firstTitleLB.textColor = [UIColor blackColor];
    self.firstTitleLB.text = @"1、Basic Usage Demo";
    
    self.firstResultLB = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.firstTabView.frame)+10, 100, 60)];
    [self.view addSubview:self.firstResultLB];
    self.firstResultLB.textAlignment = NSTextAlignmentRight;
    self.firstResultLB.font = [UIFont systemFontOfSize:14];
    self.firstResultLB.textColor = [UIColor blackColor];
    self.firstResultLB.text = @"result is : ";
    
    
    self.firstIndexLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.firstResultLB.frame), CGRectGetMaxY(self.firstTabView.frame)+10, 35, 60)];
    [self.view addSubview:self.firstIndexLB];
    self.firstIndexLB.textAlignment = NSTextAlignmentLeft;
    self.firstIndexLB.font = [UIFont boldSystemFontOfSize:20];
    self.firstIndexLB.textColor = [UIColor redColor];
    self.firstIndexLB.text = [NSString stringWithFormat:@"%d",0];
    
    
}
- (void)addSecondDemo {
    self.secondArray = @[@"男装",@"女装",@"童装",@"工装"];
    self.secondTabView = [[ZHXTabView alloc]initWithTitles:self.secondArray];
    [self.view addSubview:self.secondTabView];
    self.secondTabView.frame = CGRectMake(20, 400, ScreenWidth -40, 50);
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
- (void)addThirdDemo{
    NSArray *titles = @[@"Asian",@"Europe",@"Antarctica",@"Africa"];
    self.thirdTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.thirdTabView];
    self.thirdTabView.frame = CGRectMake(20, 650, ScreenWidth -40, 50);
    self.thirdTabView.delegate = self;
    
    self.thirdTabView.leftPadding = 10;
    self.thirdTabView.rightPadding = 10;
    self.thirdTabView.itemLineColor = [UIColor blueColor];
    self.thirdTabView.itemSelectedTextColor = [UIColor blueColor];
    
    self.thirdTitleLB = [[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMinY(self.thirdTabView.frame)-60, ScreenWidth -40, 60)];
    [self.view addSubview:self.thirdTitleLB];
    self.thirdTitleLB.textAlignment = NSTextAlignmentLeft;
    self.thirdTitleLB.font = [UIFont boldSystemFontOfSize:18];
    self.thirdTitleLB.textColor = [UIColor blackColor];
    self.thirdTitleLB.text = @"3、Custom Mask Demo";
    
    self.thirdResultLB = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.thirdTabView.frame)+10, self.thirdTabView.frame.size.width-65, 60)];
    [self.view addSubview:self.thirdResultLB];
    self.thirdResultLB.textAlignment = NSTextAlignmentRight;
    self.thirdResultLB.font = [UIFont systemFontOfSize:14];
    self.thirdResultLB.textColor = [UIColor blackColor];
    self.thirdResultLB.text = @"The location index you currently selected is : ";
    
    
    self.thirdIndexLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.thirdResultLB.frame), CGRectGetMaxY(self.thirdTabView.frame)+10, 35, 60)];
    [self.view addSubview:self.thirdIndexLB];
    self.thirdIndexLB.textAlignment = NSTextAlignmentLeft;
    self.thirdIndexLB.font = [UIFont boldSystemFontOfSize:20];
    self.thirdIndexLB.textColor = [UIColor redColor];
    self.thirdIndexLB.text = [NSString stringWithFormat:@"%d",0];
}
#pragma mark - ZHXTabViewDelegate
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
    if (tabView == self.firstTabView) {
        self.firstIndexLB.text = [NSString stringWithFormat:@"%ld",(long)index];
    }else if (tabView == self.secondTabView){
         self.secondIndexLB.text = [NSString stringWithFormat:@"%@",[self.secondArray objectAtIndex:index]];
    }else if (tabView == self.thirdTabView) {
        self.thirdIndexLB.text = [NSString stringWithFormat:@"%ld",(long)index];
    }
}

@end

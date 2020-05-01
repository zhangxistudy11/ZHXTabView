//
//  DemoTwoViewController.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/5/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "DemoTwoViewController.h"
#import "ZHXTabView.h"
#import "UIView+Extension.h"
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height
@interface DemoTwoViewController ()<ZHXTabViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) ZHXTabView *secondTabView;
@property (nonatomic, strong) UILabel *secondTitleLB;
@property (nonatomic, strong) UILabel *secondResultLB;
@property (nonatomic, strong) UILabel *secondIndexLB;
@property (nonatomic, strong) NSArray *secondArray;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation DemoTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Basic Usage";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTabView];
    [self addScrollView];
}
- (void)addTabView{
    self.secondArray = @[@"男装",@"女装",@"童装",@"工装"];
    self.secondTabView = [[ZHXTabView alloc]initWithTitles:self.secondArray];
    [self.view addSubview:self.secondTabView];
    self.secondTabView.frame = CGRectMake(20, 200, ScreenWidth -40, 50);
    self.secondTabView.backgroundColor = [UIColor lightGrayColor];
    self.secondTabView.delegate = self;
    
    self.secondTabView.leftPadding = 10;
    self.secondTabView.rightPadding = 10;
    self.secondTabView.itemLineColor = [UIColor blueColor];
    self.secondTabView.itemSelectedTextColor = [UIColor blueColor];
    
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
- (void)addScrollView{
    [self.view addSubview:self.scrollView];
    
    for (int i=0; i<self.secondArray.count; i++) {
        UILabel *resultLB = [[UILabel alloc]initWithFrame:CGRectMake(i*(self.secondTabView.width), 100, self.secondTabView.width-130, 60)];
        [self.scrollView addSubview:resultLB];
        resultLB.textAlignment = NSTextAlignmentRight;
        resultLB.font = [UIFont systemFontOfSize:14];
        resultLB.textColor = [UIColor blackColor];
        resultLB.text =@"您选择的服装是:";
        
        UILabel * indexLB= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(resultLB.frame), resultLB.y, 120, 60)];
        [self.scrollView addSubview:indexLB];
        indexLB.textAlignment = NSTextAlignmentLeft;
        indexLB.font = [UIFont boldSystemFontOfSize:20];
        indexLB.textColor = [UIColor redColor];
        indexLB.text = [self.secondArray objectAtIndex:i];
    }
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollEnabled = NO;
        _scrollView.frame = CGRectMake(self.secondTabView.x, CGRectGetMaxY(self.secondTabView.frame), self.secondTabView.width,400);
        _scrollView.contentSize = CGSizeMake(self.secondTabView.width * 4, 0);
        _scrollView.backgroundColor = [UIColor cyanColor];
    }
    return _scrollView;
}
#pragma mark - ZHXTabViewDelegate
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
    if (tabView == self.secondTabView){
        [self.scrollView setContentOffset:CGPointMake(index*self.secondTabView.width, 0) animated:YES];
    }
}

@end

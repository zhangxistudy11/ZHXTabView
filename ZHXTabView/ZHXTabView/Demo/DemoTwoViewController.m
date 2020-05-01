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

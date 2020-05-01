//
//  DemoThreeViewController.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/5/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "DemoThreeViewController.h"
#import "ZHXTabView.h"

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height
@interface DemoThreeViewController ()<ZHXTabViewDelegate>
@property (nonatomic, strong) ZHXTabView *thirdTabView;
@property (nonatomic, strong) UILabel *thirdTitleLB;
@property (nonatomic, strong) UILabel *thirdResultLB;
@property (nonatomic, strong) UILabel *thirdIndexLB;
@end

@implementation DemoThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Custom Mask";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addThirdDemo];
}

- (void)addThirdDemo{
    NSArray *titles = @[@"Science",@"Mathematics",@"Nature"];
    self.thirdTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.thirdTabView];
    self.thirdTabView.frame = CGRectMake(20, 200, ScreenWidth -40, 40);
    self.thirdTabView.delegate = self;
    self.thirdTabView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.6];
    
    self.thirdTabView.leftPadding = 10;
    self.thirdTabView.rightPadding = 10;
    self.thirdTabView.itemLineColor = [UIColor clearColor];
    self.thirdTabView.itemTextColor = [UIColor whiteColor];
    self.thirdTabView.itemTextFont = [UIFont systemFontOfSize:14];
    self.thirdTabView.itemSelectedTextColor = [UIColor blackColor];
    self.thirdTabView.itemSelectedTextFont = [UIFont boldSystemFontOfSize:14];
    
    CGSize size = CGSizeMake(12, 12);
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.thirdTabView.bounds byRoundingCorners: UIRectCornerTopRight|UIRectCornerTopLeft cornerRadii:size];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.thirdTabView.layer.mask = shape;
    
    
    
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
    if (tabView == self.thirdTabView) {
        self.thirdIndexLB.text = [NSString stringWithFormat:@"%ld",(long)index];
    }
}
@end

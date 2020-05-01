//
//  DemoThreeViewController.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/5/1.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "DemoThreeViewController.h"
#import "ZHXTabView.h"
#import "UIView+Extension.h"
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.height

static float const kCornerRadius = 6.0;
@interface DemoThreeViewController ()<ZHXTabViewDelegate>
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) ZHXTabView *thirdTabView;
@property (nonatomic, strong) UILabel *thirdTitleLB;
@property (nonatomic, strong) UILabel *thirdResultLB;
@property (nonatomic, strong) UILabel *thirdIndexLB;
@property (nonatomic, strong) CAShapeLayer *trapezoidShapeLayer;
@end

@implementation DemoThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Custom Mask";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addThirdDemo];
}

- (void)addThirdDemo{
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(20, 200-kCornerRadius, ScreenWidth -40, 40+kCornerRadius)];
    [self.view addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor whiteColor];
//

    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, kCornerRadius, self.contentView.width, self.contentView.height-kCornerRadius)];
    [self.contentView addSubview:self.backView];
     self.backView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.6];
    CGSize size = CGSizeMake(12, 12);
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.backView.bounds byRoundingCorners: UIRectCornerTopRight|UIRectCornerTopLeft cornerRadii:size];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.backView.layer.mask = shape;
    
    [self.contentView.layer addSublayer:self.trapezoidShapeLayer];
    


    
    NSArray *titles = @[@"Science",@"Mathematics",@"Nature"];
    self.thirdTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.contentView addSubview:self.thirdTabView];
    self.thirdTabView.frame = CGRectMake(0, kCornerRadius, self.contentView.width, self.contentView.height-kCornerRadius);
    self.thirdTabView.delegate = self;
    self.thirdTabView.backgroundColor = [UIColor clearColor];
    
    
    self.thirdTabView.leftPadding = 10;
    self.thirdTabView.rightPadding = 10;
    self.thirdTabView.itemLineColor = [UIColor clearColor];
    self.thirdTabView.itemTextColor = [UIColor whiteColor];
    self.thirdTabView.itemTextFont = [UIFont systemFontOfSize:14];
    self.thirdTabView.itemSelectedTextColor = [UIColor blackColor];
    self.thirdTabView.itemSelectedTextFont = [UIFont boldSystemFontOfSize:14];
    
    
    
    
    
    self.thirdResultLB = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.contentView.frame)+10, self.thirdTabView.frame.size.width-65, 60)];
    [self.view addSubview:self.thirdResultLB];
    self.thirdResultLB.textAlignment = NSTextAlignmentRight;
    self.thirdResultLB.font = [UIFont systemFontOfSize:14];
    self.thirdResultLB.textColor = [UIColor blackColor];
    self.thirdResultLB.text = @"The location index you currently selected is : ";
    
    
    self.thirdIndexLB = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.thirdResultLB.frame), CGRectGetMaxY(self.contentView.frame)+10, 35, 60)];
    [self.view addSubview:self.thirdIndexLB];
    self.thirdIndexLB.textAlignment = NSTextAlignmentLeft;
    self.thirdIndexLB.font = [UIFont boldSystemFontOfSize:20];
    self.thirdIndexLB.textColor = [UIColor redColor];
    self.thirdIndexLB.text = [NSString stringWithFormat:@"%d",0];
    
    [self.view bringSubviewToFront:self.thirdTabView];
}
#pragma mark - Getter Method
- (CAShapeLayer *)trapezoidShapeLayer {
    if (!_trapezoidShapeLayer) {
        _trapezoidShapeLayer = [[CAShapeLayer alloc] init];
        _trapezoidShapeLayer.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height);
//        _trapezoidShapeLayer.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.4].CGColor;
        _trapezoidShapeLayer.fillColor = [UIColor cyanColor].CGColor;
        _trapezoidShapeLayer.path = [self createPathWithOffset:0].CGPath;
    }
    return _trapezoidShapeLayer;
}
#pragma mark - ZHXTabViewDelegate
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
    if (tabView == self.thirdTabView) {
        self.thirdIndexLB.text = [NSString stringWithFormat:@"%ld",(long)index];
    }
}
#pragma mark - Private Method
- (UIBezierPath *)createPathWithOffset:(CGFloat)offset{
    CGFloat totalWidth = self.contentView.width;
    CGFloat itemWidth = self.contentView.width/3;
    CGFloat radius = 2*kCornerRadius;
    CGFloat topY = 0;
    CGFloat middleY = radius;
    CGFloat middleBottomY = self.contentView.height-radius;
    CGFloat bottomY = self.contentView.height;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];

    CGPoint p1 = CGPointZero, p2 = CGPointZero, p3 = CGPointZero, p4 = CGPointZero, p5 = CGPointZero ,
    p6=CGPointZero;
    CGPoint c1 = CGPointZero, c2 = CGPointZero;
    [path moveToPoint:p1];
    p1 = CGPointMake(radius, topY);
    p2 = CGPointMake(p1.x+itemWidth-2*radius, topY);
    [path addLineToPoint:p2];

    c1 = CGPointMake(p1.x+itemWidth-2*radius, middleY);
    [path addArcWithCenter:c1 radius:radius startAngle:1.5 * M_PI endAngle:2 * M_PI clockwise:YES];
    
    p3 = CGPointMake(p1.x+itemWidth-radius, middleY);
    [path addLineToPoint:p3];
    
    p4 = CGPointMake(p1.x+itemWidth-radius, bottomY);
    [path addLineToPoint:p4];
    
    p5 = CGPointMake(p1.x-radius, bottomY);
    [path addLineToPoint:p5];
    
    p6 = CGPointMake(p1.x-radius, middleY);
    [path addLineToPoint:p6];
    
    c2 = CGPointMake(p1.x, middleY);
    
    [path addArcWithCenter:c2 radius:radius startAngle:M_PI endAngle:1.5*M_PI clockwise:YES];



    return path;
}
@end

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
@interface DemoThreeViewController ()<ZHXTabViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) ZHXTabView *thirdTabView;
@property (nonatomic, strong) CAShapeLayer *trapezoidShapeLayer;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation DemoThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Custom Mask";
    self.view.backgroundColor = [UIColor yellowColor];
    [self addMaskLayer];
    [self addTabView];
    [self addScrollView];
}
- (void)addMaskLayer {
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(20, 200-kCornerRadius, ScreenWidth -40, 40+kCornerRadius)];
    [self.view addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.backView = [[UIView alloc]initWithFrame:CGRectMake(0, kCornerRadius, self.contentView.width, self.contentView.height-kCornerRadius)];
    [self.contentView addSubview:self.backView];
    self.backView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.6];
    CGSize size = CGSizeMake(12, 12);
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:self.backView.bounds byRoundingCorners: UIRectCornerTopRight|UIRectCornerTopLeft cornerRadii:size];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.backView.layer.mask = shape;
    
    [self.contentView.layer addSublayer:self.trapezoidShapeLayer];
}
- (void)addTabView{
    
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
    
    
    
}
- (void)addScrollView{
    [self.view addSubview:self.scrollView];
    
    for (int i=0; i<3; i++) {
        UILabel *resultLB = [[UILabel alloc]initWithFrame:CGRectMake(i*(self.contentView.width), 100, self.contentView.width-40, 60)];
        [self.scrollView addSubview:resultLB];
        resultLB.textAlignment = NSTextAlignmentRight;
        resultLB.font = [UIFont systemFontOfSize:14];
        resultLB.textColor = [UIColor blackColor];
        resultLB.text = @"The location index you currently selected is:";
        
        
        UILabel * indexLB= [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(resultLB.frame), resultLB.y, 35, 60)];
        [self.scrollView addSubview:indexLB];
        indexLB.textAlignment = NSTextAlignmentLeft;
        indexLB.font = [UIFont boldSystemFontOfSize:20];
        indexLB.textColor = [UIColor redColor];
        indexLB.text = [NSString stringWithFormat:@"%d",i];
    }
}
#pragma mark - Getter Method
- (CAShapeLayer *)trapezoidShapeLayer {
    if (!_trapezoidShapeLayer) {
        _trapezoidShapeLayer = [[CAShapeLayer alloc] init];
        _trapezoidShapeLayer.frame = CGRectMake(0, 0, self.contentView.width, self.contentView.height);
        _trapezoidShapeLayer.fillColor = [UIColor whiteColor].CGColor;
        _trapezoidShapeLayer.path = [self createPathWithOffset:0].CGPath;
    }
    return _trapezoidShapeLayer;
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
        _scrollView.frame = CGRectMake(self.contentView.x, CGRectGetMaxY(self.contentView.frame), self.contentView.width,400);
        _scrollView.contentSize = CGSizeMake(self.contentView.width * 3, 0);
        _scrollView.backgroundColor = [UIColor whiteColor];
    }
    return _scrollView;
}
#pragma mark - ZHXTabViewDelegate
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
    if (tabView == self.thirdTabView) {
        [self.scrollView setContentOffset:CGPointMake(index*self.contentView.width, 0) animated:YES];
    }
}
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    
    CGFloat maskOffset = self.contentView.width * (offset/(self.scrollView.width*3));
    self.trapezoidShapeLayer.path = [self createPathWithOffset:maskOffset].CGPath;
    
}
#pragma mark - Private Method
- (UIBezierPath *)createPathWithOffset:(CGFloat)offset{
    CGFloat itemWidth = self.contentView.width/3;
    CGFloat radius = 2*kCornerRadius;
    CGFloat topY = 0;
    CGFloat middleY = radius;
    CGFloat middleBottomY = self.contentView.height-radius;
    CGFloat bottomY = self.contentView.height;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    CGPoint p1 = CGPointZero, p2 = CGPointZero, p3 = CGPointZero, p4 = CGPointZero, p5 = CGPointZero ,
    p6=CGPointZero,p7=CGPointZero,p8=CGPointZero;
    CGPoint c1 = CGPointZero, c2 = CGPointZero,c3 = CGPointZero, c4 = CGPointZero;
    [path moveToPoint:p1];
    CGFloat p1X = radius + offset;
    p1 = CGPointMake(p1X, topY);
    p2 = CGPointMake(p1.x+itemWidth-2*radius, topY);
    [path addLineToPoint:p2];
    
    c1 = CGPointMake(p1.x+itemWidth-2*radius, middleY);
    [path addArcWithCenter:c1 radius:radius startAngle:1.5 * M_PI endAngle:2 * M_PI clockwise:YES];
    
    p3 = CGPointMake(p1.x+itemWidth-radius, middleY);
    [path addLineToPoint:p3];
    
    p4 = CGPointMake(p1.x+itemWidth-radius, middleBottomY);
    [path addLineToPoint:p4];
    
    if (offset>=(itemWidth*2-0.05)) {
        //right limit
        p5 = CGPointMake(self.contentView.width, bottomY);
        [path addLineToPoint:p5];
    }else if ( offset>=(itemWidth*2-radius-0.05) ){
        //right excessive stage
        c2 = CGPointMake(p4.x+(self.contentView.width-p4.x)/2, bottomY);
        p5 = CGPointMake(self.contentView.width, bottomY);
        [path addQuadCurveToPoint:p5 controlPoint:c2];
    }else {
        c2 = CGPointMake(p4.x, bottomY);
        p5 = CGPointMake(p4.x+radius, bottomY);
        [path addQuadCurveToPoint:p5 controlPoint:c2];
    }
    
    p7 = CGPointMake(p1.x-radius,middleBottomY);
    p8 = CGPointMake(p1.x-radius, middleY);
    if (offset<=0) {
        //left limit
        p6 = CGPointMake(0, bottomY);
        [path addLineToPoint:p6];
        [path addLineToPoint:p7];
        [path addLineToPoint:p8];
    }else if (offset<=radius){
        //left excessive stage
        p6 = CGPointMake(0, bottomY);
        [path addLineToPoint:p6];
        c3 = CGPointMake(p7.x/2, bottomY);
        [path addQuadCurveToPoint:p7 controlPoint:c3];
    }else{
        p6 = CGPointMake(p7.x-radius, bottomY);
        [path addLineToPoint:p6];
        c3 = CGPointMake(p7.x, bottomY);
        [path addQuadCurveToPoint:p7 controlPoint:c3];
    }
    c4 = CGPointMake(p1.x, middleY);
    
    [path addArcWithCenter:c4 radius:radius startAngle:M_PI endAngle:1.5*M_PI clockwise:YES];
    
    return path;
}
@end

//
//  ZHXTabItemView.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/4/26.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ZHXTabItemView.h"
#import "UIView+Extension.h"
#define RandomColor [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1]

@interface ZHXTabItemView()

@end
@implementation ZHXTabItemView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self initView];
//    }
//    return self;
//}
- (instancetype)init
{
    self = [super init];
    if (self) {
    [self initView];
    }
    return self;
}
- (void)initView{
    self.label = [[UILabel alloc]init];
    [self addSubview:self.label];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textAlignment = NSTextAlignmentCenter;
//    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.mas_centerY);
//        make.centerX.equalTo(self.mas_centerX);
//    }];
    self.label.center = self.center;
    
    
    
    self.badge = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.badge];
    [self.badge setContentEdgeInsets:UIEdgeInsetsMake(1, 4, 1, 4)];
    self.badge.titleLabel.font = [UIFont systemFontOfSize:10];
    self.badge.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.badge setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.badge.backgroundColor = [UIColor orangeColor];
//    [self.badge mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.label.mas_right);
//        make.bottom.equalTo(self.label.mas_top).offset(8);
//        make.width.mas_equalTo(33);
//        make.height.mas_equalTo(15);
//    }];
    self.badge.width = 33;
    self.badge.height = 15;
    

    CGSize size =CGSizeMake(7.5, 7.5);
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 33, 15) byRoundingCorners: UIRectCornerBottomRight|UIRectCornerTopRight|UIRectCornerTopLeft cornerRadii:size];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.badge.layer.mask = shape;
    
    self.badge.hidden = YES;
    
    self.backgroundColor = RandomColor;
}
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.label.frame = CGRectMake(0, 0, self.width, <#CGFloat height#>)
//    
//    self.badge.frame = CGRectMake(CGRectGetMaxX(self.label.frame)-33, self.label.y-10, 33, 15);

}
@end

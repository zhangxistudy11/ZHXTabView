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
    
    
    
//    self.badge.hidden = YES;
    
    self.backgroundColor = RandomColor;
}
- (void)layoutSubviews {
    [super layoutSubviews];


}
@end

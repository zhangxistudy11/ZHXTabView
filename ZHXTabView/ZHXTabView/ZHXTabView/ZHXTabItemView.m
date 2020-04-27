//
//  ZHXTabItemView.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/4/26.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ZHXTabItemView.h"

@interface ZHXTabItemView()

@end
@implementation ZHXTabItemView

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
    self.label.textAlignment = NSTextAlignmentCenter;
}
- (void)layoutSubviews {
    [super layoutSubviews];


}
@end

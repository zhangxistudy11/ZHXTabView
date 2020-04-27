//
//  ZHXTabView.h
//  ZHXTabView
//
//  Created by 张玺 on 2020/4/26.
//  Copyright © 2020 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^IndexChangeBlock)(NSInteger index);

@interface ZHXTabView : UIView

- (instancetype)initWithTitles:(NSArray *)titles;

@property (nonatomic, assign) CGFloat leftPadding;///<left inner margin

@property (nonatomic, assign) CGFloat rightPadding;///<right inner margin

@property (nonatomic, assign) CGFloat itemHeight;///< item height . Value is MIN(itemHeihgt,self.frame.size,height),default 40.0

@property (nonatomic, assign) CGFloat itemPadding;///< padding of text and line. Default is 3

@property (nonatomic, assign) CGFloat itemTextHeight;///<item text heihgt.Default is 20

@property (nonatomic, strong) UIFont * itemTextFont;///item text font.default systemFontOfSize:17

@property (nonatomic, assign) CGFloat itemLineHeight;///<item line height. Default is 3

@property (nonatomic, assign) CGFloat itemLineWidth;///<item line height. Default is 25

@property (nonatomic, strong) UIColor * itemLineColor;///< bottom line color . Default is [UIColor purpleColor]

@property (nonatomic, assign) CGFloat itemLineCornerRadius;/// bottom line  cornerRadius . Default is 1.5 .

/// Sets the location of the selected item by default
/// @param defaultIndex index .Default index is 0.
- (void)setDefultSelectedIndex:(NSInteger)defaultIndex;



- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;
/**
 水平方向两边的间距 默认为0
 */
@property (nonatomic,assign) float horizontalMargin;

/**
 顶部的间距 默认为0
 */
@property (nonatomic,assign) float topMargin;
/**
 底部的间距 默认为0
 */
@property (nonatomic,assign) float bottomMargin;





/**
 *  单个item背景色,默认白色
 */
@property (nonatomic,strong)UIColor *itemBackColor;

/**
 字体字号 默认14号
 */
@property (nonatomic,assign) float fontSize;

/**
 *  底部移动线条颜色
 */
@property (nonatomic,strong)UIColor *lineColor;

/**
 横线相对文字长度内缩举例 默认线为20
 */
@property (nonatomic,assign) float linePadding;

/**
 *  默认字体颜色
 */
@property (nonatomic,strong)UIColor *itemColor;

/**
 *  选中颜色
 */
@property (nonatomic,strong)UIColor *itemSelctedColor;

/**
 选中位置后回调
 */
@property (nonatomic,copy) IndexChangeBlock indexChangeBlock;

/**
 显示右上角图标提示

 @param index 第几个tab，默认从0开始
 @param title 显示的文案
 @param badgeStyleDict 图标样式 非必传
 {
 @"backColor":@"#ffffff",默认橘黄色
 @"textColor":@"#ccccc",默认白色
 @"textSize":@(10) 默认10号
 }
 @
 */
- (void)showBadgeAtIndex:(NSInteger)index title:(NSString *)title badgeStyle:(NSDictionary *)badgeStyleDict;
@end

NS_ASSUME_NONNULL_END

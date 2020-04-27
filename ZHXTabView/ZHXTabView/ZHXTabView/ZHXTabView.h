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



@property (nonatomic, assign) CGFloat leftPadding;///<left inner margin

@property (nonatomic, assign) CGFloat rightPadding;///<right inner margin

@property (nonatomic, assign) CGFloat itemHeight;///< item height . Value is MIN(itemHeihgt,self.frame.size,height),default 40.0

@property (nonatomic, assign) CGFloat itemPadding;///< padding of text and line. Default is 3

@property (nonatomic, assign) CGFloat itemTextHeight;///<item text heihgt.Default is 20

@property (nonatomic, strong) UIColor * itemBackgroundColor;///item backgroundColor.default [UIColor clearColor]

@property (nonatomic, strong) UIFont * itemTextFont;///item text font.default systemFontOfSize:17

@property (nonatomic, strong) UIColor * itemTextColor;///item text cololr.default [UIColor blackColor]

@property (nonatomic, strong) UIFont * itemSelectedTextFont;///item text font when is selected.default  boldSystemFontOfSize:17

@property (nonatomic, strong) UIColor * itemSelectedTextColor;///item text cololr when is selected.default [UIColor purpleColor]

@property (nonatomic, assign) CGFloat itemLineHeight;///<item line height. Default is 3

@property (nonatomic, assign) CGFloat itemLineWidth;///<item line height. Default is 25

@property (nonatomic, strong) UIColor * itemLineColor;///< bottom line color . Default is [UIColor purpleColor]

@property (nonatomic, assign) CGFloat itemLineCornerRadius;/// bottom line  cornerRadius . Default is 1.5 .


/// Initialization method
/// @param titles titles array
- (instancetype)initWithTitles:(NSArray <NSString *> *)titles;

/// Sets the location of the selected item by default
/// @param defaultIndex index .Default index is 0.
- (void)setDefultSelectedIndex:(NSInteger)defaultIndex;




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

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
@interface ZHXBadgeView : UIView

@end
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

/// Set the location of the selected item by default
/// @param defaultIndex index .Default index is 0.
- (void)configDefultSelectedIndex:(NSInteger)defaultIndex;


/// Set the badge relative to, and give it relative to, the text above and to the right.If you have multiple badges ,you can set it multiple times.
/// @param badgeView custom badge , need to inherit from ZHXBadgeView
/// @param index position index
/// @param size badgeView size
/// @param topOffset Badge's top can be negative relative to the spacing above the text
/// @param rightOffset The spacing on the left side of the badge relative to the right side of the text can be negative
- (void)configBadge:(ZHXBadgeView *)badgeView atIndex:(NSInteger)index  badgeSize:(CGSize)size topOffsetFromTextTop:(CGFloat)topOffset  rightOffsetFormTextRight:(CGFloat)rightOffset;



/// Sets whether the specified location is marked hidden or displayed
/// @param isHide hide
/// @param index location
- (void)configBadgeHide:(BOOL)isHide atIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END

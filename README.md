![image](https://github.com/zhangxistudy11/ZHXIndexView/blob/master/ZHXIndexView/Source/image.png)
# ZHXTabView
---------------------------------------------------------
[![](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/zhangxistudy11/ZHXTabView)
[![](https://img.shields.io/badge/language-ObjectC-brightgreen.svg)](https://github.com/zhangxistudy11/ZHXTabView)
[![](https://img.shields.io/badge/platform-iOS|8.0-lightgray.svg)](https://github.com/zhangxistudy11/ZHXTabView)
[![](https://img.shields.io/badge/中文-简书-brightgreen.svg)](https://www.jianshu.com/p/d55b74949555)

A highly customizable tab for iOS .

[中文文档地址](https://www.jianshu.com/p/d55b74949555)
# Table of Contents
---------------------------------------------------------
* [Background](#Background)
* [DisplayEffect](#DisplayEffect)
* [Install](#Install)
* [Usage](#Usage)
* [API](#API)
* [License](#License)

# Background
---------------------------------------------------------
In daily development, we often encounter usage scenarios of segmented tabs. Different scenes have different needs, some need to be animated, some need to have corner marks, and some need to mask animation. Here will provide a comprehensive ZHXTabView to meet the above needs.

# DisplayEffect
---------------------------------------------------------

basics：

![image](https://github.com/zhangxistudy11/ZHXTabView/blob/master/ZHXTabView/ZHXTabView/Resource/basic.gif)

badge：

![image](https://github.com/zhangxistudy11/ZHXTabView/blob/master/ZHXTabView/ZHXTabView/Resource/badge.gif)

mask:

![image](https://github.com/zhangxistudy11/ZHXTabView/blob/master/ZHXTabView/ZHXTabView/Resource/mask.gif)

# Install
---------------------------------------------------------
Go to github to download ZHXTabView , drag the blue circle file in the screenshot below into the project, the red circle is for introduction, you can refer to it.

![image](https://github.com/zhangxistudy11/ZHXTabView/blob/master/ZHXTabView/ZHXTabView/Resource/use.jpg)

# Usage
---------------------------------------------------------
####1. Basic use: Set ZHXTabView as the data source, and pay attention to implementing the proxy method.
```
    NSArray *titles = @[@"Asian",@"Europe",@"America",@"Africa"];
    self.firstTabView = [[ZHXTabView alloc]initWithTitles:titles];
    [self.view addSubview:self.firstTabView];
    self.firstTabView.frame = CGRectMake(20, 150, ScreenWidth -40, 50);
    self.firstTabView.delegate = self;
    self.firstTabView.leftPadding = 10;
    self.firstTabView.rightPadding = 10;
    self.firstTabView.itemLineColor = [UIColor blueColor];
    self.firstTabView.itemSelectedTextColor = [UIColor blueColor];
```
```
- (void)tabView:(ZHXTabView *)tabView didSelectItemAtIndex:(NSInteger)index{
 }
```
####2.Use with corner mark: In order to make the corner mark can be highly customized, the customized corner mark view needs to inherit ZHXBadgeView or be the object of ZHXBadgeView when it is used.
```
    ZHXBadgeView *badgeOne = [[ZHXBadgeView alloc]initWithFrame:CGRectMake(0, 0, 15, 15)];
    UILabel *hotBadge = [[UILabel alloc]initWithFrame:badgeOne.bounds];
    [badgeOne addSubview:hotBadge];
    hotBadge.backgroundColor = [UIColor redColor];
    hotBadge.textAlignment = NSTextAlignmentCenter;
    hotBadge.font = [UIFont systemFontOfSize:10];
    hotBadge.layer.cornerRadius = 7.5;
    hotBadge.clipsToBounds = YES;
    hotBadge.text = @"2";
    hotBadge.textColor = [UIColor whiteColor];
```
####At the same time, it is necessary to specify which index plus angle

```
/// Set the badge relative to, and give it relative to, the text above and to the right.If you have multiple badges ,you can set it multiple times.
/// @param badgeView custom badge , need to inherit from ZHXBadgeView
/// @param index position index
/// @param size badgeView size
/// @param topOffset Badge's top can be negative relative to the spacing above the text
/// @param rightOffset The spacing on the left side of the badge relative to the right side of the text can be negative
- (void)configBadge:(ZHXBadgeView *)badgeView atIndex:(NSInteger)index  badgeSize:(CGSize)size topOffsetFromTextTop:(CGFloat)topOffset  rightOffsetFormTextRight:(CGFloat)rightOffset;
```
####3.With a mask, you need to implement it through CAShapeLayer and UIBezierPath. For specific use, please refer to the code in the Demo, pay attention to the correct setting of the view level, and excessive animation at the bottom of the mask.

 # API
---------------------------------------------------------

```
@property (nonatomic, weak) id<ZHXTabViewDelegate> delegate;///<delegate of tabView

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
```

# License
---------------------------------------------------------

The MIT License (MIT)

Copyright © 2020 Zhang Xi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

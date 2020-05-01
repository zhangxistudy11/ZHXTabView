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
* [References](#References)
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




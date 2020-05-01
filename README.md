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
####1.基本使用:将ZHXTabView设置数据源，注意实现代理方法。
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
####2.带角标使用:为了使角标能高度自定义，自定义的角标view需要使用时继承ZHXBadgeView,或者是ZHXBadgeView的对象。
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
同时要指定哪个索引加角标
```
/// 给指定索引添加角标
/// @param badgeView 自定义的角标view
/// @param index 要添加的那个位置
/// @param size 角标的大小，(宽和高)
/// @param topOffset 角标的顶部相对于文字顶部的偏移，一般为负值
/// @param rightOffset 角标的左边相对于文字右边的偏移，一般为负值
- (void)configBadge:(ZHXBadgeView *)badgeView atIndex:(NSInteger)index  badgeSize:(CGSize)size topOffsetFromTextTop:(CGFloat)topOffset  rightOffsetFormTextRight:(CGFloat)rightOffset
```
####3.带遮罩，需要自己通过CAShapeLayer和UIBezierPath去实现。具体使用可参考Demo里的代码，注意使用时view的层级设置正确，以及遮罩底部的过度动画。
###ZHXBadgeView提供的API




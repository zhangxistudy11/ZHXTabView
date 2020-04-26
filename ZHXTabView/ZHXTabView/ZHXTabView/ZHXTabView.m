//
//  ZHXTabView.m
//  ZHXTabView
//
//  Created by 张玺 on 2020/4/26.
//  Copyright © 2020 张玺. All rights reserved.
//

#import "ZHXTabView.h"
#import "UIView+Extension.h"
#import "ZHXTabItemView.h"
@interface ZHXTabView()

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) NSMutableArray<ZHXTabItemView *> *itemViewArray;

@end

@implementation ZHXTabView
- (instancetype)initWithTitles:(NSArray *)titles {
    self = [super init];
    if (self) {
        self.itemViewArray = [[NSMutableArray alloc]init];
        self.titles = titles;
        self.itemHeight = 40;
        self.itemPadding = 3;
        self.itemLineHeight = 4;
        self.itemTextHeight = 20;
        self.itemTextFont = [UIFont systemFontOfSize:15];
        [self setupViews];
    }
    return self;
}
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self setupViews];
//    }
//    return self;
//}
#pragma mark - UI Methods
- (void)setupViews {
    
    for (int i=0; i<self.titles.count; i++) {
        NSString *title = [self.titles objectAtIndex:i];
        //        ZHXTabItemView *itemView = [[ZHXTabItemView alloc]initWithFrame:CGRectMake(itemX, self.height-itemHeight, itemWidth, itemHeight)];
        ZHXTabItemView *itemView = [[ZHXTabItemView alloc]init];
        [self addSubview:itemView];
        [self.itemViewArray addObject:itemView];
        itemView.label.text = title;
    }
}
- (void)layoutSubviews {
    [super layoutSubviews];
    float itemWidth = [self itemWidth];
    float itemX = self.leftPadding;
    float itemHeight = MIN(self.itemHeight, self.height);
    for (int i=0; i < self.titles.count; i++) {
        NSString *title = [self.titles objectAtIndex:i];
        ZHXTabItemView *itemView = [self.itemViewArray objectAtIndex:i];
        itemView.frame = CGRectMake(itemX, self.height-itemHeight, itemWidth, itemHeight);
        float textWidth = MIN(itemWidth, [self textWidthWithStr:title]);
        itemView.label.frame = CGRectMake((itemWidth-textWidth)/2, itemHeight-self.itemPadding-self.itemLineHeight-self.itemTextHeight, textWidth, self.itemTextHeight);
        itemView.label.text = title;
        itemView.label.backgroundColor = [UIColor yellowColor];
//        itemView.badge.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        
        itemX += itemWidth;
    }
}

#pragma mark - Private Methods
- (CGFloat)contentWidth {
    return self.frame.size.width;
}
- (CGFloat)itemWidth {
    if (self.titles && self.titles.count >0) {
        return ([self contentWidth]-self.leftPadding-self.rightPadding)/self.titles.count;
    }
    return 0;
}
- (float)textWidthWithStr:(NSString *)str {
    if (str) {
        NSDictionary *dict = @{NSFontAttributeName:self.itemTextFont};
        CGSize textSize = CGSizeMake(0.0f, self.itemTextHeight);
           textSize = [str boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading  attributes:dict context:nil].size;
           return ceilf(textSize.width);
       }
       return 0.0f;
}
#pragma mark Setter Methods
- (void)setLeftPadding:(CGFloat)leftPadding{
    _leftPadding = leftPadding;
}
- (void)setRightPadding:(CGFloat)rightPadding{
    _rightPadding = rightPadding;
}
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"fffffffff");
        
        //要先初始化view
        [self initView];
        NSLog(@"0000");
        
        self.titles = titles;
        NSLog(@"1111");
    }
    return self;
}
- (void)initView{
    /*
     self.horizontalMargin = 0;
     self.fontSize = 14;
     self.lineColor = [UIColor blackColor];
     */
    NSLog(@"ddd1");
    
    //    [self setUpView];
}


@end

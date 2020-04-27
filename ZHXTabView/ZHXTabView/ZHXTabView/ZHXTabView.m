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

static NSInteger const kDefaultTagOffset = 10000;

@interface ZHXTabView()

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) NSMutableArray<ZHXTabItemView *> *itemViewArray;
@property (nonatomic, assign) NSInteger selectIndex;
@end

@implementation ZHXTabView
- (instancetype)initWithTitles:(NSArray *)titles {
    self = [super init];
    if (self) {
        self.itemViewArray = [[NSMutableArray alloc]init];
        self.titles = titles;
        self.itemHeight = 40;
        self.itemPadding = 5;
        self.itemLineHeight = 3;
        self.itemLineWidth = 25;
        self.itemTextHeight = 20;
        self.selectIndex = 3;
        self.itemTextFont = [UIFont systemFontOfSize:15];
        self.itemLineColor = [UIColor purpleColor];
        self.itemLineCornerRadius = 1.5;
        [self setupViews];
    }
    return self;
}
#pragma mark - UI Methods
- (void)setupViews {
    
    for (int i=0; i<self.titles.count; i++) {
        NSString *title = [self.titles objectAtIndex:i];
        //        ZHXTabItemView *itemView = [[ZHXTabItemView alloc]initWithFrame:CGRectMake(itemX, self.height-itemHeight, itemWidth, itemHeight)];
        ZHXTabItemView *itemView = [[ZHXTabItemView alloc]init];
        [self addSubview:itemView];
        [self.itemViewArray addObject:itemView];
        itemView.tag = kDefaultTagOffset+i;
        itemView.label.text = title;
        [itemView addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.bottomLine = [[UIView alloc]init];
    [self addSubview:self.bottomLine];
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

        itemX += itemWidth;
    }
    ZHXTabItemView *itemView = [self.itemViewArray objectAtIndex:self.selectIndex];
    float lineX = CGRectGetMinX(itemView.frame)+(itemWidth-self.itemLineWidth)/2;
    self.bottomLine.frame = CGRectMake(lineX, self.height-self.itemLineHeight, self.itemLineWidth, self.itemLineHeight);
    self.bottomLine.backgroundColor = self.itemLineColor;
    self.bottomLine.layer.cornerRadius = MAX(self.itemLineHeight/2, self.itemLineCornerRadius);
    
}
#pragma mark - Event Methods
- (void)clickItem:(UIControl *)sender {
    UIControl *control = sender;
    if (control.selected) {
        return;
    }
    NSInteger tag = control.tag;
    self.selectIndex = tag-kDefaultTagOffset;
    ZHXTabItemView *itemView = [self.itemViewArray objectAtIndex:self.selectIndex];
    float lineX = CGRectGetMinX(itemView.frame)+(itemView.width-self.itemLineWidth)/2;
    self.bottomLine.alpha = 0.2;
    [UIView animateWithDuration:0.17 animations:^{
        self.bottomLine.x = lineX;
    } completion:^(BOOL finished) {
        self.bottomLine.alpha = 1.0;
    }];;
}
#pragma mark - Public Methods
- (void)setDefultSelectedIndex:(NSInteger)defaultIndex {
    if (defaultIndex<0) {
        return;
    }
    self.selectIndex = defaultIndex;
    
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



@end

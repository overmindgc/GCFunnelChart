//
//  GCFunnelChartLegend.m
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import "GCFunnelChartLegend.h"

@implementation GCFunnelChartLegend
{
    UIColor *currColor;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    if (self == [super initWithFrame:frame]) {
        currColor = color;
        self.backgroundColor = color;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 3.f;
        self.layer.borderColor = color.CGColor;
        
//        self.layer.shadowColor = [UIColor darkGrayColor].CGColor;//shadowColor阴影颜色
//        self.layer.shadowOpacity = 1;//阴影透明度，默认0
//        self.layer.shadowRadius = 2;//阴影半径，默认3
//        self.layer.shadowOffset = CGSizeMake(2,2);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self changeButtonStyle];
}

- (void)changeButtonStyle
{
    if (self.isSelected) {
//        self.layer.shadowOpacity = 0.f;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 2.f;
        [self setTitleColor:currColor forState:UIControlStateNormal];
    } else {
//        self.layer.shadowOpacity = 1.f;
        self.backgroundColor = currColor;
        self.layer.borderWidth = 0.f;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
}

@end

//
//  GCFunnelSlices.m
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import "GCFunnelSlices.h"

static const CGFloat selectedExpend = 8.f;

@implementation GCFunnelSlices
{
    CGFloat topWidth;
    CGFloat bottomWidth;
    UIColor *rectColor;
}

- (id)initWithFrame:(CGRect)frame ladderTopWidth:(CGFloat)topW ladderBottomWidth:(CGFloat)bottomW color:(UIColor *)color
{
    if (self == [super initWithFrame:frame]) {
        topWidth = topW;
        bottomWidth = bottomW;
        rectColor = color;
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGPoint pointA = CGPointZero;
    CGPoint pointB = CGPointZero;
    CGPoint pointC = CGPointZero;
    CGPoint pointD = CGPointZero;
    
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeight = self.frame.size.height;
    CGFloat topStartX = viewWidth / 2.f - topWidth / 2.f + selectedExpend;
    CGFloat topEndX = viewWidth - topStartX;
    CGFloat bottomStartX = viewWidth / 2.f - bottomWidth / 2.f + selectedExpend;
    CGFloat bottomEndX = viewWidth - bottomStartX;
    
    pointA = CGPointMake(topStartX, 0);
    pointB = CGPointMake(topEndX, 0);
    pointC = CGPointMake(bottomEndX,viewHeight);
    pointD = CGPointMake(bottomStartX,viewHeight);
    
    UIColor *color;
    if (self.isSelected) {
        color = rectColor;
        color = [color colorWithAlphaComponent:0.8];
        pointA = CGPointMake(topStartX - selectedExpend, 0);
        pointB = CGPointMake(topEndX + selectedExpend, 0);
        pointC = CGPointMake(bottomEndX + selectedExpend,viewHeight);
        pointD = CGPointMake(bottomStartX - selectedExpend,viewHeight);
    } else {
        color = rectColor;
    }
    
    [self drawRectWithColor:color
                     pointA:pointA
                     pointB:pointB
                     pointC:pointC
                     pointD:pointD];
}

- (void)drawRectWithColor:(UIColor*)color
                   pointA:(CGPoint)pA
                   pointB:(CGPoint)pB
                   pointC:(CGPoint)pC
                   pointD:(CGPoint)pD {
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //开始路径绘制
    CGContextBeginPath(context);
    
    //起点
    CGContextMoveToPoint(context,pA.x,pA.y);
    CGContextAddLineToPoint(context,pB.x, pB.y);
    CGContextAddLineToPoint(context,pC.x, pC.y);
    CGContextAddLineToPoint(context,pD.x, pD.y);
    //设置填充色
    [color setFill];
    //设置边框颜色
    [color setStroke];
    //绘制路径
    CGContextDrawPath(context,kCGPathFillStroke);
}

@end

//
//  GCFunnelColorPool.m
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import "GCFunnelColorPool.h"

static NSMutableArray *colors;
static NSInteger currentColorIndex = -1;

static NSMutableArray *bottomColors;
static NSInteger currentBottomColorIndex = -1;

@implementation GCFunnelColorPool

+ (UIColor *)colorFromPool
{
    if (!colors) {
        colors = [NSMutableArray array];
        [colors addObject:[UIColor colorWithRed:234/255.0f green:75/255.0f blue:106/255.0f alpha:1.0f]];
        [colors addObject:[UIColor colorWithRed:251/255.0f green:177/255.0f blue:81/255.0f alpha:1.0f]];
        [colors addObject:[UIColor colorWithRed:0/255.0f green:167/255.0f blue:140/255.0f alpha:1.0f]];
        [colors addObject:[UIColor colorWithRed:77/255.0f green:169/255.0f blue:244/255.0f alpha:1.0f]];
        [colors addObject:[UIColor colorWithRed:0/255.0f green:148/255.0f blue:175/255.0f alpha:1.0f]];
    }
    currentColorIndex++;
    if (currentColorIndex == colors.count) {
        currentColorIndex = 0;
    }
    return [colors objectAtIndex:currentColorIndex];
}

+ (UIColor *)colorFromBottomPool
{
    if (!bottomColors) {
        bottomColors = [NSMutableArray array];
        [bottomColors addObject:[UIColor colorWithRed:154/255.0f green:205/255.0f blue:44/255.0f alpha:1.0f]];
        [bottomColors addObject:[UIColor colorWithRed:50/255.0f green:205/255.0f blue:50/255.0f alpha:1.0f]];
    }
    currentBottomColorIndex++;
    if (currentBottomColorIndex == bottomColors.count) {
        currentBottomColorIndex = 0;
    }
    return [bottomColors objectAtIndex:currentBottomColorIndex];
}

@end

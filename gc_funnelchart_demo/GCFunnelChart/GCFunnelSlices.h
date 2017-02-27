//
//  GCFunnelSlices.h
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GCChartModel;

@interface GCFunnelSlices : UIButton

@property (nonatomic, strong) GCChartModel *currModel;

- (id)initWithFrame:(CGRect)frame ladderTopWidth:(CGFloat)topW ladderBottomWidth:(CGFloat)bottomW color:(UIColor *)color;

@end

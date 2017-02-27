//
//  GCFunnelChart.h
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCChartModel.h"

@interface GCFunnelChart : UIView

- (id)initWithFrame:(CGRect)frame chartModelArray:(NSArray<GCChartModel*> *)dataArray showLegend:(BOOL)showLegend;

@end

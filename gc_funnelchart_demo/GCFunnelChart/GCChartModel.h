//
//  GCChartModel.h
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GCChartModel : NSObject

@property (nonatomic) CGFloat value;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic) BOOL isBottom;

@end

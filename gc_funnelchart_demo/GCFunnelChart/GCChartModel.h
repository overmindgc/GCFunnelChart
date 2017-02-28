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

/**可以为空，id标记*/
@property (nonatomic) NSString *id;
/**必填，数据渲染需要的数值*/
@property (nonatomic) CGFloat value;
/**可以为空，显示在图例上的内容*/
@property (nonatomic, copy) NSString *name;
/**可以为空，使用默认颜色*/
@property (nonatomic, strong) UIColor *color;
/**是否是底部，如果是就显示成长方形，默认否*/
@property (nonatomic) BOOL isBottom;

@end

//
//  GCFunnelColorPool.h
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GCFunnelColorPool : NSObject

+ (UIColor *)colorFromPool;

+ (UIColor *)colorFromBottomPool;

@end

//
//  ViewController.m
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import "ViewController.h"
#import "GCFunnelChart/GCFunnelChart.h"
#import "GCFunnelChart/GCChartModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *dataArray = [NSMutableArray array];
    GCChartModel *model1 = [[GCChartModel alloc] init];
    model1.value = 200;
    model1.name = @"20%";
    [dataArray addObject:model1];
    GCChartModel *model2 = [[GCChartModel alloc] init];
    model2.value = 200;
    model2.name = @"40%";
    [dataArray addObject:model2];
    GCChartModel *model3 = [[GCChartModel alloc] init];
    model3.value = 200;
    model3.name = @"60%";
    [dataArray addObject:model3];
    GCChartModel *model7 = [[GCChartModel alloc] init];
    model7.value = 10;
    model7.name = @"90%";
    [dataArray addObject:model7];
    GCChartModel *model4 = [[GCChartModel alloc] init];
    model4.value = 200;
    model4.name = @"80%";
    [dataArray addObject:model4];
    GCChartModel *model5 = [[GCChartModel alloc] init];
    model5.value = 100;
    model5.name = @"100%";
    model5.isBottom = YES;
    [dataArray addObject:model5];
//    GCChartModel *model6 = [[GCChartModel alloc] init];
//    model6.value = 350;
//    model6.name = @"100%";
//    model6.isBottom = YES;
//    [dataArray addObject:model6];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    GCFunnelChart *chartView = [[GCFunnelChart alloc] initWithFrame:CGRectMake(20, 100, screenWidth - 40, 250) chartModelArray:dataArray showLegend:YES];
//    chartView.layer.borderWidth = 1.f;
    [self.view addSubview:chartView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

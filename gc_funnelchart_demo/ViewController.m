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
{
    GCFunnelChart *chartView;
}

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
    
    _resultLabel = [[UILabel alloc] init];
    _resultLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_resultLabel];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    chartView = [[GCFunnelChart alloc] initWithFrame:CGRectMake(20, 100, screenWidth - 40, 250)
                                     chartModelArray:dataArray
                                          showLegend:YES];
    __weak __typeof(self)weakSelf = self;
    chartView.sliceSelectedBlock = ^(NSInteger idx,GCChartModel *model){
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        strongSelf.resultLabel.text = [NSString stringWithFormat:@"选中了第%ld个，%@",idx+1,model.name];
    };
    [self.view addSubview:chartView];
    [chartView selectSliceWithIndex:0];
    
    _resultLabel.frame = CGRectMake(screenWidth/2 - 200/2, chartView.frame.origin.y + chartView.frame.size.height + 40, 200, 30);
    
    UIButton *changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 - 80/2, chartView.frame.origin.y + chartView.frame.size.height + 100, 80, 30)];
    [changeBtn setTitle:@"随机数据" forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(changeData) forControlEvents:UIControlEventTouchUpInside];
    [changeBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:changeBtn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeData
{
    _resultLabel.text = @"";
    NSMutableArray *dataArray = [NSMutableArray array];
    NSInteger num = 5;
    for (NSInteger i=0; i<num; i++) {
        NSInteger value = arc4random() % 100;
        GCChartModel *model = [[GCChartModel alloc] init];
        model.value = value;
        model.name = [NSString stringWithFormat:@"%ld%%",(long)value];
        if (i == num-1) {
            model.isBottom = YES;
        }
        [dataArray addObject:model];
    }
    [chartView reloadChartWithDataSource:dataArray];
}

@end

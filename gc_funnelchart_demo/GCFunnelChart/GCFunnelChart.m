//
//  GCFunnelChart.m
//  gc_funnelchart_demo
//
//  Created by 辰 宫 on 25/02/2017.
//  Copyright © 2017 辰 宫. All rights reserved.
//

#import "GCFunnelChart.h"
#import "GCFunnelSlices.h"
#import "GCFunnelColorPool.h"
#import "GCFunnelChartLegend.h"

static const CGFloat bottomPercent = 0.2;
static const CGFloat verticalGap = 1.5;
static const CGFloat legendHeight = 25.f;
static const CGFloat legendLineGap = 10.f;

@implementation GCFunnelChart
{
    NSArray<GCChartModel*> *_dataArray;
    
    NSMutableArray<GCFunnelSlices*> *slicesArray;
    
    NSMutableArray<GCFunnelChartLegend*> *legendViewArray;
    
    BOOL isShowLegend;
}

- (id)initWithFrame:(CGRect)frame chartModelArray:(NSArray<GCChartModel*> *)dataArray showLegend:(BOOL)showLegend
{
    if (self = [super initWithFrame:frame]) {
        slicesArray = [NSMutableArray array];
        legendViewArray = [NSMutableArray array];
        _dataArray = dataArray;
        isShowLegend = showLegend;
        self.backgroundColor = [UIColor whiteColor];
        if (_dataArray && _dataArray.count > 0) {
            [self initFunnelSlices];
        }
    }
    return self;
}

- (void)initFunnelSlices
{
    //计算图例内容大小
    NSInteger legendLineNum = 5;
    CGFloat legendPerSpace = self.frame.size.width / legendLineNum;
    CGFloat legendWidth = legendPerSpace * 0.75;
    CGFloat legendGap = (self.frame.size.width - legendWidth * legendLineNum) / (legendLineNum - 1);
    
    CGFloat dataCount = _dataArray.count;
    NSInteger lineCount = ceilf(dataCount / (CGFloat)legendLineNum);
    
    CGFloat legendViewHeight = 0.f;
    if (isShowLegend) {
        legendViewHeight = legendLineGap * 2 + (legendHeight + legendLineGap) * lineCount;
    }
    
    //添加漏斗和图例
    CGFloat bottomWidth = self.frame.size.width * bottomPercent;
    CGFloat perValueHeight = 0.f;
    CGFloat perValuePadding = 0.f;
    
    CGFloat totalValue = 0.f;
    CGFloat bottomValue = 0.f;
    CGFloat funnelValue = 0.f;
    for (GCChartModel *model in _dataArray) {
        totalValue = totalValue + model.value;
        if (model.isBottom) {
            bottomValue = bottomValue + model.value;
        }
    }
    funnelValue = totalValue - bottomValue;
    perValueHeight = (self.frame.size.height - (_dataArray.count - 1) * verticalGap - legendViewHeight) / totalValue;
    
    CGFloat maxPadding = self.frame.size.width - bottomWidth;
    perValuePadding = maxPadding / funnelValue;
    
    CGFloat slicesY = 0.f;
    CGFloat currValue = 0.f;
    NSInteger currLegendLine = 0;
    NSInteger lineIndex = 0;
    for (NSInteger i=0; i<_dataArray.count; i++) {
        GCChartModel *model = [_dataArray objectAtIndex:i];
        CGRect slicesFrame = CGRectMake(0, slicesY, self.frame.size.width, perValueHeight * model.value);
        CGFloat ladderTopW = 0.f;
        CGFloat ladderBottomW = 0.f;
        if (model.isBottom) {
            ladderTopW = bottomWidth;
            ladderBottomW = bottomWidth;
        } else {
            ladderTopW = self.frame.size.width - currValue * perValuePadding - 2;//减去一点误差
            currValue = currValue + model.value;
            ladderBottomW = self.frame.size.width - currValue * perValuePadding;
        }
        UIColor *slicesColor = model.color;
        if (!slicesColor) {
            if (model.isBottom) {
                slicesColor = [GCFunnelColorPool colorFromBottomPool];
            } else {
                slicesColor = [GCFunnelColorPool colorFromPool];
            }
        }
        GCFunnelSlices *slicesView = [[GCFunnelSlices alloc] initWithFrame:slicesFrame ladderTopWidth:ladderTopW ladderBottomWidth:ladderBottomW color:slicesColor];
        slicesView.currModel = model;
        [slicesView addTarget:self action:@selector(slicesClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:slicesView];
        [slicesArray addObject:slicesView];
        
        slicesY = slicesY + perValueHeight * model.value + verticalGap;
        
        if (isShowLegend) {
            if (i > 0 && i % legendLineNum == 0) {
                currLegendLine++;
                lineIndex = 0;
            }
            CGFloat legendX;
            if (lineIndex == 0) {
                legendX = 0;
            } else {
                legendX = lineIndex * (legendGap + legendWidth);
            }
            CGFloat legentY = self.frame.size.height - legendViewHeight + legendLineGap*2 + currLegendLine * (legendHeight + legendLineGap);
            CGRect legendBtnRect = CGRectMake(legendX, legentY, legendWidth, legendHeight);
            GCFunnelChartLegend *legendView = [[GCFunnelChartLegend alloc] initWithFrame:legendBtnRect color:slicesColor];
            legendView.currModel = model;
            [legendView setTitle:model.name forState:UIControlStateNormal];
            [legendView addTarget:self action:@selector(legendClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:legendView];
            [legendViewArray addObject:legendView];
            
            lineIndex++;
        }
    }
}

- (void)reloadChartWithDataSource:(NSArray *)newDataArray
{   
    if (newDataArray && newDataArray.count > 0) {
        _dataArray = newDataArray;
        for (GCFunnelSlices *slicesView in slicesArray) {
            [slicesView removeFromSuperview];
        }
        [slicesArray removeAllObjects];
        for (GCFunnelChartLegend *legendView in legendViewArray) {
            [legendView removeFromSuperview];
        }
        [legendViewArray removeAllObjects];
        [self initFunnelSlices];
    }
}

- (void)slicesClicked:(id)sender
{
    GCFunnelSlices *selectView = (GCFunnelSlices *)sender;
    NSInteger selectIndex = [_dataArray indexOfObject:selectView.currModel];
    [self selectSliceWithIndex:selectIndex];
}

- (void)legendClicked:(id)sender
{
    GCFunnelChartLegend *selectView = (GCFunnelChartLegend *)sender;
    NSInteger selectIndex = [_dataArray indexOfObject:selectView.currModel];
    [self selectSliceWithIndex:selectIndex];
}

- (void)selectSliceWithIndex:(NSInteger)index
{
    if (index > _dataArray.count - 1) {
        return;
    }
    
    GCChartModel *selectedModel = [_dataArray objectAtIndex:index];
    
    for (GCFunnelSlices *legendView in legendViewArray) {
        if (legendView.currModel == selectedModel) {
            [legendView setSelected:YES];
        } else {
            [legendView setSelected:NO];
        }
    }
    
    for (GCFunnelSlices *slicesView in slicesArray) {
        if (slicesView.currModel == selectedModel) {
            [slicesView setSelected:YES];
        } else {
            [slicesView setSelected:NO];
        }
    }
    
    if (_sliceSelectedBlock) {
        _sliceSelectedBlock(index,selectedModel);
    }
}

@end

# GCFunnelChart
### OC实现的漏斗图表
```
typedef void (^FunnelSliceSelectBlock) (NSInteger idx,GCChartModel *model);
/*根据数据源初始化/
(id)initWithFrame:(CGRect)frame chartModelArray:(NSArray<GCChartModel*> *)dataArray showLegend:(BOOL)showLegend;
/*根据数据源重新加载/
(void)reloadChartWithDataSource:(NSArray *)newDataArray;
/*根据index选中某一个切片/
(void)selectSliceWithIndex:(NSInteger)index;
/*点击切片和选中某一切片回调/ @property (nonatomic, copy) FunnelSliceSelectBlock sliceSelectedBlock;
```




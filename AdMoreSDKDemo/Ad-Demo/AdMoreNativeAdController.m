//
//  AdMoreNativeAdController.m
//  AdMoreSDKDemo
//
//  Created by Hayder on 2023/5/16.
//  demo只是其中一种使用方法，可以根据实际使用情况进行调整

#import "AdMoreNativeAdController.h"
#import "SCNewsContentCell.h"
#import <MJRefresh/MJRefresh.h>

@interface AdMoreNativeAdController ()<AdMoreNativeAdDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) AdMoreNativeAd *nativeAd;

//展示的数据源
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *nativeShowViews;

//广告对象数组，需要将每次的广告对象保存好，不然会影响单个广告View事件的回调
@property (nonatomic, strong) NSMutableArray *nativeAdModels;

//加载成功个数
@property (nonatomic, assign) NSInteger loadSuccessCount;
//渲染成功个数
@property (nonatomic, assign) NSInteger renderSuccessCount;
//渲染失败个数
@property (nonatomic, assign) NSInteger renderFailCount;

@end

@implementation AdMoreNativeAdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
    [self.tableView.mj_header beginRefreshing];
}

- (void)setUI
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[SCNewsContentRadioCell class] forCellReuseIdentifier:@"SCNewsContentRadioCell"];
    [self.tableView registerClass:[SCNewsContentBigImageCell class] forCellReuseIdentifier:@"SCNewsContentBigImageCell"];
    [self.tableView registerClass:[SCNewsContentSmallImageCell class] forCellReuseIdentifier:@"SCNewsContentSmallImageCell"];
    [self.tableView registerClass:[SCNewsContentSmallImagePlayCell class] forCellReuseIdentifier:@"SCNewsContentSmallImagePlayCell"];
    [self.tableView registerClass:[SCNewsContentBigImagePlayCell class] forCellReuseIdentifier:@"SCNewsContentBigImagePlayCell"];
    [self.tableView registerClass:[SCNewsNativeAdCell class] forCellReuseIdentifier:@"SCNewsNativeAdCell"];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                                     refreshingAction:@selector(loadData)];
    self.tableView.mj_header = header;
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.dataSource = [NSMutableArray array];
    self.nativeShowViews = [NSMutableArray array];
    self.nativeAdModels = [NSMutableArray array];
}

- (void)loadData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.tableView.mj_header endRefreshing];
        [self.dataSource removeAllObjects];
        [self.dataSource addObjectsFromArray:[self generateListData]];
        [self.tableView reloadData];
        //加载广告
        [self loadNativeAd];
    });
}

- (void)loadMoreData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.tableView.mj_footer endRefreshing];
        [self.dataSource addObjectsFromArray:[self generateListData]];
        [self.tableView reloadData];
        
        if(self.nativeShowViews.count>0) //从数组中取出广告，插入到数据源中
        {
            [self insertNativeAdToDataSource];
        }else
        {
            [self loadNativeAd];
        }
    });
}

#pragma mark ---------------------tableviewDelegate datasource----------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //isLeftRight 是否左右  isVideo 是否是视频   isReader播放的view
    SCNewsModel *newsModel = self.dataSource[indexPath.row];
    SCNewsContentCell *cell = nil;
    if (newsModel.isReader) {
        cell = (SCNewsContentRadioCell *)[tableView dequeueReusableCellWithIdentifier:@"SCNewsContentRadioCell"];
        [cell refreshNewsModel:newsModel];
    }else
    {
        if (newsModel.isLeftRight) {//左右
            
            if (newsModel.isVideo) {
                cell = (SCNewsContentSmallImagePlayCell *)[tableView dequeueReusableCellWithIdentifier:@"SCNewsContentSmallImagePlayCell"];
                [cell refreshNewsModel:newsModel];
            }else
            {
                cell = (SCNewsContentSmallImageCell *)[tableView dequeueReusableCellWithIdentifier:@"SCNewsContentSmallImageCell"];
                [cell refreshNewsModel:newsModel];
            }
            
        }else
        {
            if (newsModel.isVideo) {
                cell = (SCNewsContentBigImagePlayCell *)[tableView dequeueReusableCellWithIdentifier:@"SCNewsContentBigImagePlayCell"];
                [cell refreshNewsModel:newsModel];
            }else
            {
                cell = (SCNewsContentBigImageCell *)[tableView dequeueReusableCellWithIdentifier:@"SCNewsContentBigImageCell"];
                [cell refreshNewsModel:newsModel];
            }
        }
    }

    if(newsModel.nativeAdView) //广告
    {
        cell = (SCNewsNativeAdCell *)[tableView dequeueReusableCellWithIdentifier:@"SCNewsNativeAdCell"];
        [cell refreshNewsModel:newsModel];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCNewsModel *newsModel = self.dataSource[indexPath.row];
    return newsModel.height;
}

#pragma mark ---------------------NativeAd----------------------------
- (void)loadNativeAd
{
    self.nativeAd = [[AdMoreNativeAd alloc] initWithSlotID:kNativeID rootController:[UIApplication sharedApplication].keyWindow.rootViewController adSize:CGSizeMake(HH_SCREEN_WIDTH, 0)];
    self.nativeAd.delegate = self;
    [self.nativeAd loadAdDataWithCount:3];
    [self.nativeAdModels addObject:self.nativeAd];
}

#pragma mark ---------------------AdMoreNativeAdDelegate----------------------------
/**信息流广告加载成功*/
- (void)nativeAdViewsLoadSuccess:(NSArray *)nativeAdViews
{
    self.loadSuccessCount = nativeAdViews.count;
    self.renderSuccessCount = 0;
    self.renderFailCount = 0;
}
/**信息流广告加载失败**/
- (void)nativeAdViewsFailedToLoadWithError:(NSError *)error
{
    
}

/**信息流渲染成功---多次回调*/
- (void)nativeAdViewRenderSuccess:(UIView *)nativeAdView
{
    self.renderSuccessCount += 1;
    
    SCNewsModel *adModel = [[SCNewsModel alloc] init];
    adModel.nativeAdView = nativeAdView;
    adModel.height = nativeAdView.height;
    [self.nativeShowViews addObject:adModel];
    
    //证明加载完毕，可以放入数据源进行刷新
    if(self.loadSuccessCount == self.renderSuccessCount + self.renderFailCount)
    {
        [self insertNativeAdToDataSource];
    }
    
}
/**信息流渲染失败*/
- (void)nativeAdViewFailedToRender:(UIView *)nativeAdView error:(nonnull NSError *)error
{
    self.renderFailCount += 1;
}

/**信息流点击事件**/
- (void)nativeAdViewDidClick:(UIView *)nativeAdView
{
    NSLog(@"nativeAd:信息流点击");
}
/**信息流关闭事件*/
- (void)nativeAdViewDidClose:(UIView *)nativeAdView
{
    SCNewsModel *result;
    for (SCNewsModel *newsModel in self.dataSource) {
        if(newsModel.nativeAdView == nativeAdView)
        {
            result = newsModel;
            break;
        }
    }
    
    if(result)
    {
        [nativeAdView removeFromSuperview];
        [self.dataSource removeObject:result];
        [self.tableView reloadData];
    }
}

/**视频完成播放**/
- (void)nativeAdViewPlayerDidPlayFinish:(id)nativeAdView
{
    NSLog(@"nativeAd:视频完成播放");
}
/**视频播放，可能回调多次，暂停->继续播放也会回调**/
- (void)nativeAdViewVideoDidPlaying:(id)nativeAdView
{
    NSLog(@"nativeAd:视频播放");
}
/**视频暂停播放**/
- (void)nativeAdViewVideoDidPause:(id)nativeAdView
{
    NSLog(@"nativeAd:视频暂停");
}

#pragma mark ---------------------private----------------------------
- (void)insertNativeAdToDataSource
{
    SCNewsModel *newsModel = self.nativeShowViews.firstObject;
    if (self.dataSource && self.dataSource.count >0) {
        if(self.dataSource.count > 5)
        {
            [self.dataSource insertObject:newsModel atIndex:self.dataSource.count - 4];
        }else
        {
            [self.dataSource insertObject:newsModel atIndex:self.dataSource.count - 1];
        }
    }
    [self.nativeShowViews removeObject:newsModel];
    [self.tableView reloadData];
}

- (NSMutableArray *)generateListData
{
    NSMutableArray *news = [NSMutableArray array];
    
    SCNewsModel *model1 = [[SCNewsModel alloc] init];
    model1.isReader = YES;
    model1.height = [SCNewsContentRadioCell cellHeight];
    [news addObject:model1];
    
    SCNewsModel *model2 = [[SCNewsModel alloc] init];
    model2.isLeftRight = YES;
    model2.isVideo = YES;
    model2.height = [SCNewsContentSmallImagePlayCell cellHeight];
    [news addObject:model2];
    
    SCNewsModel *model3 = [[SCNewsModel alloc] init];
    model3.isLeftRight = YES;
    model3.isVideo = YES;
    model3.height = [SCNewsContentSmallImageCell cellHeight];
    [news addObject:model3];
    
    SCNewsModel *model4 = [[SCNewsModel alloc] init];
    model4.isVideo = YES;
    model4.height = [SCNewsContentBigImagePlayCell cellHeight];
    [news addObject:model4];
    
    SCNewsModel *model5 = [[SCNewsModel alloc] init];
    model5.isVideo = YES;
    model5.height = [SCNewsContentBigImageCell cellHeight];
    [news addObject:model5];
    
    SCNewsModel *model6 = [[SCNewsModel alloc] init];
    model6.isLeftRight = YES;
    model6.isVideo = YES;
    model6.height = [SCNewsContentSmallImagePlayCell cellHeight];
    [news addObject:model6];
    
    SCNewsModel *model7 = [[SCNewsModel alloc] init];
    model7.isLeftRight = YES;
    model7.isVideo = YES;
    model7.height = [SCNewsContentSmallImagePlayCell cellHeight];
    [news addObject:model7];
    
    SCNewsModel *model8 = [[SCNewsModel alloc] init];
    model8.isVideo = YES;
    model8.height = [SCNewsContentBigImageCell cellHeight];
    [news addObject:model8];
    
    SCNewsModel *model9 = [[SCNewsModel alloc] init];
    model9.isVideo = YES;
    model9.height = [SCNewsContentBigImagePlayCell cellHeight];
    [news addObject:model9];
    
    SCNewsModel *model10 = [[SCNewsModel alloc] init];
    model10.isReader = YES;
    model10.height = [SCNewsContentRadioCell cellHeight];
    [news addObject:model10];
    
    return news;
}


@end

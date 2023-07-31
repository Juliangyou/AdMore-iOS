//
//  AdMoreDrawAdController.m
//  AdMoreSDKDemo
//
//  Created by Hayder on 2023/5/18.
//

#import "AdMoreDrawAdController.h"
#import "SCDrawAdCell.h"
#import <MJRefresh/MJRefresh.h>

@interface AdMoreDrawAdController ()<AdMoreDrawAdDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) AdMoreDrawAd *drawAd;
//展示的数据源
@property (nonatomic, strong) NSMutableArray *dataSource;
//展示的广告View数组
@property (nonatomic, strong) NSMutableArray *showViewsArray;
//信息流对象数组
@property (nonatomic, strong) NSMutableArray *drawAdModels;

@property (nonatomic, assign) NSInteger count;

@end

@implementation AdMoreDrawAdController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDrawAd];
    
    [self.view addSubview:self.collectionView];
    
    self.showViewsArray = [NSMutableArray array];
    self.drawAdModels = [NSMutableArray array];
    self.dataSource = [NSMutableArray array];
    
    [self loadData];
}



- (void)loadData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.collectionView.mj_header endRefreshing];
        [self.dataSource removeAllObjects];
        [self.dataSource addObjectsFromArray:[self generateListData]];
        [self.collectionView reloadData];
        
        if(self.showViewsArray.count>0) //从数组中取出广告，插入到数据源中
        {
            [self insertNativeAdToDataSource];
        }else
        {
            [self loadDrawAd];
        }
    });
}

- (void)loadMoreData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.collectionView.mj_footer endRefreshing];
        [self.dataSource addObjectsFromArray:[self generateListData]];
        [self.collectionView reloadData];
        
        if(self.showViewsArray.count>0) //从数组中取出广告，插入到数据源中
        {
            [self insertNativeAdToDataSource];
        }else
        {
            [self loadDrawAd];
        }
    });
}

#pragma mark ---------------------collectionDelegate datasource----------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    SCDrawAdModel *drawModel = self.dataSource[indexPath.row];
   if(drawModel.adView)
   {
       SCDrawAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SCDrawAdCell" forIndexPath:indexPath];
       [cell refreshDrawAdModel:drawModel];
       return cell;
   }else
   {
       SCDrawContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SCDrawContentCell" forIndexPath:indexPath];
       cell.model = drawModel;
       return cell;
   }
}


#pragma mark ---------------------drawAd----------------------------
- (void)loadDrawAd
{
    //每次都需要创建一个新的 ad 对象
    self.drawAd = [[AdMoreDrawAd alloc] initWithSlotID:kDrawID rootController:kRootViewController];
    self.drawAd.delegate = self;
    [self.drawAd loadAdDataWithCount:3];
    [self.drawAdModels addObject:self.drawAd];
}

#pragma mark ---------------------AdMoreDrawAdDelegate----------------------------
/**draw广告加载成功*/
- (void)drawAdViewsLoadSuccess:(NSArray *)drawAdViews
{
    NSLog(@"广告加载成功%@",drawAdViews);
}
/**draw广告加载失败**/
- (void)drawAdViewsFailedToLoadWithError:(NSError *)error
{
    [self.view hideActivityHUD];
    NSLog(@"广告加载失败%@",error.description);
}

/**广告渲染成功*/
- (void)drawAdViewRenderSuccess:(UIView *)drawAdView
{
    SCDrawAdModel *model = [[SCDrawAdModel alloc] init];
    model.adView = drawAdView;
    [self.showViewsArray addObject:model];
}
/**广告渲染失败*/
- (void)drawAdViewFailedToRender:(UIView *)drawAdView error:(NSError *)error
{
    [self.view hideActivityHUD];
    NSLog(@"广告渲染失败%@",error.description);
}

/**广告点击事件**/
- (void)drawAdViewDidClick:(UIView *)drawAdView
{
    NSLog(@"广告点击");
}
/**广告关闭事件*/
- (void)drawAdViewDidClose:(UIView *)drawAdView
{
    NSLog(@"广告关闭");
}

/**视频完成播放**/
- (void)drawAdViewPlayerDidPlayFinish:(UIView *)drawAdView
{
    NSLog(@"视频完成播放");

}
/**视频播放，可能回调多次，暂停->继续播放也会回调**/
- (void)drawAdViewVideoDidPlaying:(UIView *)drawAdView
{
    NSLog(@"广告正在播放");
    
    AdMoreDrawAd *ad = [self getAdByShowView:drawAdView];
    AdMoreAdInfo *adInfo = [ad getAdInfoWithShowView:drawAdView];
    NSLog(@"adInfo:adnName:%@",adInfo.adnName);
    NSLog(@"adInfo:ecpm:%@",adInfo.ecpm);
    NSLog(@"adInfo:slotID:%@",adInfo.slotID);
    NSLog(@"adInfo:requestID:%@",adInfo.requestID);
    
}
/**视频暂停播放**/
- (void)drawAdViewVideoDidPause:(UIView *)drawAdView
{
    NSLog(@"视频暂停播放");
}

#pragma mark ---------------------private----------------------------
- (AdMoreDrawAd *)getAdByShowView:(UIView *)showView
{
    AdMoreDrawAd *result = nil;
    for (AdMoreDrawAd *drawAd in self.drawAdModels) {
        if([drawAd showViewIsInCurrentAd:showView])
        {
            result = drawAd;
            continue;
        }
    }
    
    return result;
}

- (void)insertNativeAdToDataSource
{
   SCDrawAdModel *drawViewModel = self.showViewsArray.firstObject;
   if (self.dataSource && self.dataSource.count >0) {
       if(self.dataSource.count > 5)
       {
           [self.dataSource insertObject:drawViewModel atIndex:self.dataSource.count - 4];
       }else
       {
           [self.dataSource insertObject:drawViewModel atIndex:self.dataSource.count - 1];
       }
   }
   [self.showViewsArray removeObject:drawViewModel];
   [self.collectionView reloadData];
}

- (NSMutableArray *)generateListData
{
   NSMutableArray *drawContentModels = [NSMutableArray array];
   
    for (int i=0; i<6; i++) {
        
        SCDrawAdModel *model = [[SCDrawAdModel alloc] init];
        model.num = self.count;
        [drawContentModels addObject:model];
        
        self.count ++;
    }
   return drawContentModels;
}

- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(HH_SCREEN_WIDTH, HH_SCREEN_HEIGHT);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, HH_SCREEN_WIDTH, HH_SCREEN_HEIGHT) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[SCDrawAdCell class] forCellWithReuseIdentifier:@"SCDrawAdCell"];
        [_collectionView registerClass:[SCDrawContentCell class] forCellWithReuseIdentifier:@"SCDrawContentCell"];
        
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self
                                                                         refreshingAction:@selector(loadData)];
        _collectionView.mj_header = header;
        
        MJRefreshBackNormalFooter *footer =  [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        _collectionView.mj_footer = footer;
        
    }
    
    return _collectionView;
}


@end

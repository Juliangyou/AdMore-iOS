//
//  AdMoreSplashController.m
//  AdMoreSDKDemo
//
//  Created by Hayder on 2023/5/9.
//

#import "AdMoreSplashAdController.h"

@interface AdMoreSplashAdController ()<AdMoreSplashAdDelegate>

@property (nonatomic, strong) AdMoreSplashAd *splashAd;

@end

@implementation AdMoreSplashAdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)loadEvent
{
    [super loadEvent];
    
    [self.view showActivityHUD];
    //每次都需要创建一个新的 ad 对象
    self.splashAd = [[AdMoreSplashAd alloc] initWithSlotID:kSplashID appId:kAppID ritId:kSplahRitID rootViewController:kRootViewController];
    self.splashAd.delegate = self;
    [self.splashAd loadADData];
}

- (void)showEvent
{
    [self.splashAd showSplashAdInRootViewController:kRootViewController];
}

/**加载成功*/
- (void)splashAdDidLoad:(AdMoreSplashAd *)splashAd
{
    [self.view hideActivityHUD];
    [self.view toastMessage:@"加载成功"];
    [self showLoadTime];
}
/// 加载失败回调
- (void)splashAd:(AdMoreSplashAd *)splashAd didFailWithError:(NSError *)error
{
    [self.view hideActivityHUD];
    NSLog(@"splashAd:加载失败回调");
}
/// 展示成功回调
- (void)splashAdWillVisible:(AdMoreSplashAd *)splashAd
{
    AdMoreAdInfo *adInfo = [self.splashAd getAdInfo];
    NSLog(@"adInfo:adnName:%@",adInfo.adnName);
    NSLog(@"adInfo:ecpm:%@",adInfo.ecpm);
    NSLog(@"adInfo:slotID:%@",adInfo.slotID);
    NSLog(@"adInfo:requestID:%@",adInfo.requestID);
    
    NSLog(@"splashAd:展示成功回调");
}
//展示失败
- (void)splashAdDidShowFailed:(AdMoreSplashAd *)splashAd error:(NSError *)error
{
    [self.view hideActivityHUD];
    NSLog(@"splashAd:展示失败回调：%@",error.description);
}
/// 广告点击回调
- (void)splashAdDidClick:(AdMoreSplashAd *)splashAd
{
    NSLog(@"splashAd:广告点击回调");
}
/// 广告关闭回调
- (void)splashAdDidClose:(AdMoreSplashAd *)splashAd
{
    NSLog(@"splashAd:广告关闭回调");
}
@end

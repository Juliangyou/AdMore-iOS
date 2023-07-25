//
//  AppDelegate.m
//  AdMoreSDKDemo
//
//  Created by Hayder on 2023/5/8.
//

#import "AppDelegate.h"
#import "AdMoreHomeListController.h"
#import "AdMoreGlobalDefine.h"

#pragma mark - 申请IDFA权限
#import <AdSupport/AdSupport.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@interface AppDelegate ()<AdMoreSplashAdDelegate>

@property (nonatomic, strong) AdMoreSplashAd *splashAd;

@property (nonatomic, assign) NSTimeInterval startTime;
@property (nonatomic, assign) NSTimeInterval endTime;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[AdMoreHomeListController alloc] init]];
    
    [AdMoreSDKManager initAdMoreSDKWithAppID:kAppID completion:^(BOOL isSuccess, NSError * _Nonnull error) {
        //等初始化成功后再使用广告
        if(isSuccess)
        {
            [self preLoadAd];
            //开屏广告
            [self addSplashAD];
        }
    }];
#if DEBUG
    [AdMoreSDKManager openDebugLog:YES];
    NSLog(@"AdMoreVersion:%@",[AdMoreSDKManager version]);
#endif

    return YES;
}

- (void)preLoadAd
{
    AdMoreFullScreenInterstitialAd *interstitialAd = [[AdMoreFullScreenInterstitialAd alloc] initWithSlotID:kFullScreenInterstitialID];
    
    AdMoreRewardVideoAd *jiFenrewardAd = [[AdMoreRewardVideoAd alloc] initWithSlotID:kRewardVideoID];
    
    [AdMoreSDKManager preLoadAds:@[interstitialAd,jiFenrewardAd]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
                    NSLog(@"%@",idfa);
            } else {
                NSLog(@"请在设置-隐私-跟踪中允许App请求跟踪");
            }
        }];
    } else {
        if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
            NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            NSLog(@"%@",idfa);
        } else {
            NSLog(@"请在设置-隐私-广告中打开广告跟踪功能");
        }
    }
}

- (void)addSplashAD
{
    self.splashAd = [[AdMoreSplashAd alloc] initWithSlotID:kSplashID appId:kAppID ritId:kSplahRitID rootViewController:kRootViewController];
    self.splashAd.delegate = self;
    [self.splashAd loadADData];
}

#pragma mark ---------------------splashAdDelegate----------------------------
/// 加载成功回调
- (void)splashAdDidLoad:(AdMoreSplashAd *)splashAd
{
    [self.splashAd showSplashAdInRootViewController:kRootViewController];
}
/// 加载失败回调
- (void)splashAd:(AdMoreSplashAd *)splashAd didFailWithError:(NSError *)error
{
    
}
/// 展示成功回调
- (void)splashAdWillVisible:(AdMoreSplashAd *)splashAd
{
    
}
//展示失败
- (void)splashAdDidShowFailed:(AdMoreSplashAd *)splashAd error:(NSError *)error
{
    
}
/// 广告点击回调
- (void)splashAdDidClick:(AdMoreSplashAd *)splashAd
{
    
}
/// 广告关闭回调
- (void)splashAdDidClose:(AdMoreSplashAd *)splashAd
{
    
}

@end

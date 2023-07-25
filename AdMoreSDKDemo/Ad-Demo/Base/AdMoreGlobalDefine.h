//
//  AdMoreGlobalDefine.h
//  AdMoreSDKDemo
//
//  Created by Hayder on 2023/5/10.
//

#ifndef AdMoreGlobalDefine_h
#define AdMoreGlobalDefine_h

#import "AdMoreCategoryHeader.h"

#if __has_include(<AdMoreSDK/AdMoreSDK.h>)
#import <AdMoreSDK/AdMoreSDK.h>
#else
#import "AdMoreSDK.h"
#endif

#import "AdSlotIdDefine.h"

//屏幕宽高
#define HH_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define HH_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

//根控制器
#define kRootViewController [UIApplication sharedApplication].keyWindow.rootViewController

#define Font(size) [UIFont systemFontOfSize:size]
#define BoldFont(size) [UIFont boldSystemFontOfSize:size]
#define FontHeight(size) Font(size).lineHeight

#define kThemeColor [UIColor colorWithRed:224.0/255.0 green:51.0/255.0 blue:37.0/255.0 alpha:1.0]

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
// 51灰
#define kGray_51 [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
// 68灰
#define kGray_68 [UIColor colorWithRed:68.0/255.0 green:68.0/255.0 blue:68.0/255.0 alpha:1.0]
// 85灰
#define kGray_85 [UIColor colorWithRed:85.0/255.0 green:85.0/255.0 blue:85.0/255.0 alpha:1.0]
// 105灰
#define kGray_105 [UIColor colorWithRed:105.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1.0]
// 150灰
#define kGray_150 [UIColor colorWithRed:150.0/255.0 green:150.0/255.0 blue:150.0/255.0 alpha:1.0]
// 182灰
#define kGray_182 [UIColor colorWithRed:182.0/255.0 green:182.0/255.0 blue:182.0/255.0 alpha:1.0]
// 200灰
#define kGray_200 [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0]
// 230灰
#define kGray_230 [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]
// 240灰
#define kGray_240 [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0]
// 250灰
#define kGray_250 [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0]

#endif

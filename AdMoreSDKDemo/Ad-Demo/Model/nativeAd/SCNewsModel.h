//
//  SCNewsModel.h
//  Smart
//
//  Created by Hayder on 2022/10/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCNewsModel : NSObject

@property (nonatomic, assign) BOOL isLeftRight;
@property (nonatomic, assign) BOOL isReader;
@property (nonatomic, assign) BOOL isTop;
@property (nonatomic, assign) BOOL isVideo;


@property (nonatomic, assign) CGFloat height;

@property (nonatomic, strong) UIView *nativeAdView;


@end

NS_ASSUME_NONNULL_END

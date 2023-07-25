//
//  SCNewsContentCell.h
//  Smart
//
//  Created by Hayder on 2022/10/10.
//

#import <UIKit/UIKit.h>
#import "SCNewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCNewsContentCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, assign) CGFloat margin;

+ (CGFloat)cellHeight;

- (void)refreshNewsModel:(SCNewsModel *)model;

@end


/**
 语音播报cell
 */
@interface SCNewsContentRadioCell : SCNewsContentCell

@property (nonatomic, strong) UILabel *toTopLabel;

@property (nonatomic, strong) UIButton *toPlay;

@end

/**
 大图cell
 */
@interface SCNewsContentBigImageCell : SCNewsContentCell

@property (nonatomic, strong) UIImageView *contentImageView;

@end

/**
 小图cell  height 86
 */
@interface SCNewsContentSmallImageCell : SCNewsContentCell

@property (nonatomic, strong) UIImageView *contentImageView;

@end

/**
 大图播放cell
 */
@interface SCNewsContentBigImagePlayCell : SCNewsContentCell


@property (nonatomic, strong) UIImageView *contentImageView;

@property (nonatomic, strong) UIButton *playBtn;

@property (nonatomic, strong) UILabel *videoTimelabel;


@end

/**
 小图播放cell
 */
@interface SCNewsContentSmallImagePlayCell : SCNewsContentCell


@property (nonatomic, strong) UIImageView *contentImageView;

@property (nonatomic, strong) UIButton *playBtn;

@property (nonatomic, strong) UILabel *videoTimelabel;

@end


/**
 广告cell
 */
@interface SCNewsNativeAdCell : SCNewsContentCell

@property (nonatomic, strong) UIView *adView;

@end

NS_ASSUME_NONNULL_END

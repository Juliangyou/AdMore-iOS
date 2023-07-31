//
//  SCDrawAdCell.h
//  AdMoreSDKDemo
//
//  Created by Hayder on 2023/7/31.
//

#import <UIKit/UIKit.h>
#import "SCDrawAdModel.h"
#import "AdMoreGlobalDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCDrawContentCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *numLabel;

@property (nonatomic, strong) SCDrawAdModel *model;

@end


@interface SCDrawAdCell : UICollectionViewCell

@property (nonatomic, strong) UIView *adView;

@property (nonatomic, strong) SCDrawAdModel *model;

- (void)refreshDrawAdModel:(SCDrawAdModel *)model;

@end

NS_ASSUME_NONNULL_END

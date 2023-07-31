//
//  SCDrawAdCell.m
//  AdMoreSDKDemo
//
//  Created by Hayder on 2023/7/31.
//

#import "SCDrawAdCell.h"

@implementation SCDrawContentCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, HH_SCREEN_WIDTH , HH_SCREEN_HEIGHT)];
        label.font = [UIFont boldSystemFontOfSize:50];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        self.numLabel = label;
    }
    
    return self;
}

- (void)setModel:(SCDrawAdModel *)model
{
    _model = model;
    
    self.numLabel.text = [NSString stringWithFormat:@"%ld",model.num];
}

@end

@implementation SCDrawAdCell



- (void)refreshDrawAdModel:(SCDrawAdModel *)model
{
    [self.adView removeFromSuperview];
    self.adView = model.adView;
    [self.contentView addSubview:self.adView];
}
@end

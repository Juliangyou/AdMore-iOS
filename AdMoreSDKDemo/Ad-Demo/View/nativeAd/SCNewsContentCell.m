//
//  SCNewsContentCell.m
//  Smart
//
//  Created by Hayder on 2022/10/10.
//

#import "SCNewsContentCell.h"
#import "AdMoreGlobalDefine.h"

#define titleNumLines 3

@implementation SCNewsContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.margin = 15;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = kGray_51;
        titleLabel.font = Font(17);
        titleLabel.numberOfLines = titleNumLines;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.textColor = kGray_150;
        descLabel.font = Font(11);
        descLabel.numberOfLines = 0;
        [self.contentView addSubview:descLabel];
        self.descLabel = descLabel;
    }
    
    return self;
}

+ (CGFloat)cellHeight
{
    return 86;
}

- (void)refreshNewsModel:(SCNewsModel *)model
{
    
}

+ (CGFloat)smallImageWidthHeightScale
{
    return 0.75;
}

+ (CGFloat)bigImageWidthHeightScale
{
    return 0.5625;
}

@end

@implementation SCNewsContentRadioCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
       
        CGFloat margin = self.margin;
        self.titleLabel.frame = CGRectMake(margin,10, HH_SCREEN_WIDTH - 2 *margin, 50);
        
        //toTopLabel
        UILabel *toTopLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin,self.titleLabel.bottom+6, 25, 14)];
        toTopLabel.textColor = kThemeColor;
        toTopLabel.text = @"置顶";
        toTopLabel.font = Font(10);
        [self.contentView addSubview:toTopLabel];
        self.toTopLabel = toTopLabel;
        self.toTopLabel.hidden = YES;
        
        UIButton *toPlay = [UIButton buttonWithUIProperty:PBButtonProperty.init()
                            .frame(CGRectMake(toTopLabel.right+4, toTopLabel.y, 40, toTopLabel.height))
                            .imageName(@"h_声音")
                            .title(@"播报")
                            .fontSize(10)
                            .titleColor(kThemeColor)];
        toPlay.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        [self.contentView addSubview:toPlay];
        self.toPlay = toPlay;
        
        self.descLabel.frame = CGRectMake(toPlay.right+8,toTopLabel.y, self.titleLabel.width - (toPlay.right+8),  toTopLabel.height);
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(margin, 95, HH_SCREEN_WIDTH-2*margin, 1)];
        line.backgroundColor = kGray_240;
        [self.contentView addSubview:line];
    }
    
    return self;
}

- (void)refreshNewsModel:(SCNewsModel *)model
{
    CGFloat margin = self.margin;
    self.titleLabel.text = @"我是一个标题";
    self.toTopLabel.hidden = !model.isTop;
    self.descLabel.text =[NSString stringWithFormat:@"%@  %@",@"人民网",@"5评论数"];
    if (model.isTop) {
        self.toTopLabel.x = margin;
        self.toPlay.x = self.toTopLabel.right + 8;
        self.descLabel.x = self.toPlay.right+8;
    }else
    {
        self.toPlay.x = margin;
        self.descLabel.x = self.toPlay.right+8;
    }
}

+ (CGFloat)cellHeight
{
    return 96;
}

@end

@implementation SCNewsContentBigImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat margin = self.margin;
        
        self.titleLabel.frame = CGRectMake(margin,10, HH_SCREEN_WIDTH - 2 *margin, 50);
        
        CGFloat imageViewW = HH_SCREEN_WIDTH - 2 *margin;
        CGFloat imageViewH = [SCNewsContentCell bigImageWidthHeightScale] * imageViewW;
        UIImageView *contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(margin, self.titleLabel.bottom+2, imageViewW, imageViewH)];
        contentImageView.backgroundColor = kGray_240;
        contentImageView.layer.cornerRadius = 8;
        contentImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:contentImageView];
        self.contentImageView = contentImageView;
   
        self.descLabel.frame = CGRectMake(margin,contentImageView.bottom+8, imageViewW,  14);
        
        CGFloat height = [SCNewsContentBigImageCell cellHeight];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(margin, height-1, HH_SCREEN_WIDTH-2*margin, 1)];
        line.backgroundColor = kGray_240;
        [self.contentView addSubview:line];
    }
    
    return self;
}

- (void)refreshNewsModel:(SCNewsModel *)model
{
    self.titleLabel.text = @"这是一个标题";
    self.descLabel.text = [NSString stringWithFormat:@"%@  %@  %@",@"环球网",[NSString stringWithFormat:@"%@评论数",@"7"],@"6月1日"];
}

+ (CGFloat)cellHeight
{
    return 57 + (HH_SCREEN_WIDTH - 2 *12)*[SCNewsContentCell bigImageWidthHeightScale] + 8 + 14 +8 + 15;
}
@end

@implementation SCNewsContentSmallImageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat margin = self.margin;
        
        CGFloat imageViewW = 135;
        CGFloat imageViewH = [SCNewsContentCell smallImageWidthHeightScale] * imageViewW;
        UIImageView *contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(HH_SCREEN_WIDTH - margin - imageViewW, 18, imageViewW, imageViewH)];
        contentImageView.backgroundColor = kGray_240;
        contentImageView.layer.cornerRadius = 8;
        contentImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:contentImageView];
        self.contentImageView = contentImageView;
        
        self.titleLabel.frame = CGRectMake(margin,contentImageView.top, HH_SCREEN_WIDTH - 3 *margin - imageViewW, imageViewH - 30);
        self.descLabel.frame = CGRectMake(margin,contentImageView.bottom - 30, self.titleLabel.width,  30);
        
        CGFloat height = [SCNewsContentSmallImageCell cellHeight];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(margin, height-1, HH_SCREEN_WIDTH-2*margin, 1)];
        line.backgroundColor = kGray_240;
        [self.contentView addSubview:line];
    }
    
    return self;
}

- (void)refreshNewsModel:(SCNewsModel *)model
{
    self.titleLabel.text = @"这是一个标题";
    self.descLabel.text = [NSString stringWithFormat:@"%@  %@  %@",@"环球网",[NSString stringWithFormat:@"%@评论数",@"7"],@"6月1日"];
  
}

+ (CGFloat)cellHeight
{
    return 136;
}

@end

@implementation SCNewsContentBigImagePlayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat margin = self.margin;
        
        self.titleLabel.frame = CGRectMake(margin,5, HH_SCREEN_WIDTH - 2 *margin, 50);
      
        CGFloat imageViewW = HH_SCREEN_WIDTH - 2 *margin;
        CGFloat imageViewH = [SCNewsContentCell bigImageWidthHeightScale] * imageViewW;
        UIImageView *contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(margin, self.titleLabel.bottom+5, imageViewW, imageViewH)];
        contentImageView.backgroundColor = kGray_240;
        contentImageView.layer.cornerRadius = 8;
        contentImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:contentImageView];
        self.contentImageView = contentImageView;
        
        UIButton *playBtn = [UIButton buttonWithUIProperty:PBButtonProperty.init()
                             .frame(CGRectMake(0, 0, imageViewW, imageViewH))];
        [self.contentImageView addSubview:playBtn];
        self.playBtn = playBtn;
        
        UILabel *videoTimelabel = [[UILabel alloc] initWithFrame:CGRectMake(8,imageViewH-8-20, imageViewW-16,  20)];
        videoTimelabel.textColor = UIColor.whiteColor;
        videoTimelabel.text = @"08:21";
        videoTimelabel.font = BoldFont(11);
        videoTimelabel.backgroundColor = RGBA(0, 0, 0, 0.2);
        videoTimelabel.textAlignment = NSTextAlignmentCenter;
        [videoTimelabel cornerRadius:4];
        [self.contentImageView addSubview:videoTimelabel];
        self.videoTimelabel = videoTimelabel;
        
        self.descLabel.frame = CGRectMake(margin,contentImageView.bottom+8, contentImageView.width,  14);
        
        CGFloat height = [SCNewsContentBigImagePlayCell cellHeight];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(margin, height-1, HH_SCREEN_WIDTH-2*margin, 1)];
        line.backgroundColor = kGray_240;
        [self.contentView addSubview:line];
    }
    
    return self;
}

- (void)refreshNewsModel:(SCNewsModel *)model
{
    self.titleLabel.text = @"这是一个标题";
    self.descLabel.text = [NSString stringWithFormat:@"%@  %@  %@",@"环球网",[NSString stringWithFormat:@"%@评论数",@"7"],@"6月1日"];
    self.videoTimelabel.text = @"00:21";
    [self layoutIfNeeded];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat videoTimelabelW = [self.videoTimelabel.text sizeWithFont:self.videoTimelabel.font maxW:MAXFLOAT].width + 10;
    self.videoTimelabel.width = videoTimelabelW;
    self.videoTimelabel.x = self.contentImageView.width - videoTimelabelW - 5;
    
}

+ (CGFloat)cellHeight
{
    return 60 + (HH_SCREEN_WIDTH - 2 *12)*[SCNewsContentCell bigImageWidthHeightScale] + 8 + 14 +8 + 10;
}
@end


@implementation SCNewsContentSmallImagePlayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat margin = self.margin;
        
        CGFloat imageViewW = 135;
        CGFloat imageViewH = [SCNewsContentCell smallImageWidthHeightScale] * imageViewW;
        UIImageView *contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(HH_SCREEN_WIDTH - margin - imageViewW, 18, imageViewW, imageViewH)];
        contentImageView.backgroundColor = kGray_240;
        contentImageView.layer.cornerRadius = 8;
        contentImageView.layer.masksToBounds = YES;
        [self.contentView addSubview:contentImageView];
        self.contentImageView = contentImageView;
        
        UIButton *playBtn = [UIButton buttonWithUIProperty:PBButtonProperty.init()
                             .frame(CGRectMake(0, 0, imageViewW, imageViewH))
                             .imageName(@"h_播放2")];
        [self.contentImageView addSubview:playBtn];
        self.playBtn = playBtn;
        
        UILabel *videoTimelabel = [[UILabel alloc] initWithFrame:CGRectMake(8,imageViewH-4-20, imageViewW-16,  20)];
        videoTimelabel.textColor = UIColor.whiteColor;
        videoTimelabel.text = @"08:21";
        videoTimelabel.font = BoldFont(11);
        videoTimelabel.backgroundColor = RGBA(0, 0, 0, 0.2);
        videoTimelabel.textAlignment = NSTextAlignmentCenter;
        [videoTimelabel cornerRadius:4];
        [self.contentImageView addSubview:videoTimelabel];
        self.videoTimelabel = videoTimelabel;
        
        self.titleLabel.frame = CGRectMake(margin,contentImageView.top, HH_SCREEN_WIDTH - 3 *margin - imageViewW, imageViewH - 30);
        
        self.descLabel.frame = CGRectMake(margin,contentImageView.bottom-30, self.titleLabel.width,  30);
        
        CGFloat height = [SCNewsContentSmallImagePlayCell cellHeight];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(margin, height-1, HH_SCREEN_WIDTH-margin, 1)];
        line.backgroundColor = kGray_240;
        [self.contentView addSubview:line];
    }
    
    return self;
}

- (void)refreshNewsModel:(SCNewsModel *)model
{
    self.titleLabel.text = @"我是一个标题";
    self.descLabel.text = [NSString stringWithFormat:@"%@  %@  %@",@"国际在线",[NSString stringWithFormat:@"%@评论数",@"5"],@"6月15日"];
    self.videoTimelabel.text = @"00:11";
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
     
    CGFloat videoTimelabelW = [self.videoTimelabel.text sizeWithFont:self.videoTimelabel.font maxW:MAXFLOAT].width + 10;
    self.videoTimelabel.width = videoTimelabelW;
    self.videoTimelabel.x = self.contentImageView.width - videoTimelabelW - 5;
}

+ (CGFloat)cellHeight
{
    return 136;
}
@end



@implementation SCNewsNativeAdCell

- (void)refreshNewsModel:(SCNewsModel *)model
{
    [self.adView removeFromSuperview];
    self.adView = model.nativeAdView;
    [self.contentView addSubview:self.adView];
}

@end

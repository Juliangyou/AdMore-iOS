//
//  HHLabelProperty.h
//  Smart
//
//  Created by Hayder on 2022/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHLabelProperty : NSObject

@property (nonatomic, assign) CGRect hhframe;
@property (nonatomic, strong) NSString *hhtext;
@property (nonatomic, assign) CGFloat hhfontSize;
@property (nonatomic, assign) CGFloat hhBoldfontSize;
@property (nonatomic, strong) UIColor *hhtextColor;
@property (nonatomic, assign) NSTextAlignment hhtextAlignment;
@property (nonatomic, assign) CGFloat hhCornerRadius;
@property (nonatomic, strong) UIColor *hhbackgroundColor;
@property (nonatomic, assign) NSInteger hhnumberOfLines;
+ (HHLabelProperty *(^)(void))init;
- (HHLabelProperty *(^)(CGRect frame))frame;
- (HHLabelProperty *(^)(NSString *text))text;
- (HHLabelProperty *(^)(CGFloat fontSize))fontSize;
- (HHLabelProperty *(^)(CGFloat boldFontSize))boldFontSize;
- (HHLabelProperty *(^)(UIColor *textColor))textColor;
- (HHLabelProperty *(^)(NSTextAlignment textAlignment))textAlignment;
- (HHLabelProperty *(^)(UIColor *backgroundColor))backgroundColor;
- (HHLabelProperty *(^)(CGFloat cornerRadius))CornerRadius;
- (HHLabelProperty *(^)(NSInteger numberOfLines))numberOfLines;
@end

NS_ASSUME_NONNULL_END

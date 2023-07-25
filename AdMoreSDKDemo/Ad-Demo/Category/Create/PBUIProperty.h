//
//  PBUIProperty.h
//  PayBox
//
//  Created by Hayder on 2022/2/8.
//

#import <UIKit/UIKit.h>

@interface PBButtonProperty : NSObject

@property (nonatomic, assign) CGRect pbframe;
@property (nonatomic, strong) NSString *pbTitle;
@property (nonatomic, strong) UIColor *pbTitleColor;
@property (nonatomic, strong) NSString *pb_s_title;
@property (nonatomic, strong) UIColor *pb_s_titleColor;
@property (nonatomic, assign) CGFloat pbFontSize;

@property (nonatomic, strong) NSString *pbimageName;
@property (nonatomic, strong) NSString *pb_s_imageName;

@property (nonatomic, strong) NSString *pbBackgroundImage;
@property (nonatomic, strong) NSString *pb_s_backgroundImage;
@property (nonatomic, strong) UIColor *pbBackgroudColor;

@property (nonatomic, assign) CGFloat pbCornerRadius;
@property (nonatomic, strong) id pbtarget;
@property (nonatomic, assign) SEL pbaction;

+ (instancetype)property;

+ (PBButtonProperty *(^)(void))init;
- (PBButtonProperty *(^)(CGRect frame))frame;
- (PBButtonProperty *(^)(NSString *title))title;
- (PBButtonProperty *(^)(UIColor *titleColor))titleColor;
- (PBButtonProperty *(^)(NSString *s_title))selectedTitle;
- (PBButtonProperty *(^)(UIColor *s_titleColor))selectedTitleColor;
- (PBButtonProperty *(^)(CGFloat fontSize))fontSize;
- (PBButtonProperty *(^)(NSString *imageName))imageName;
- (PBButtonProperty *(^)(NSString *s_imageName))selectedImageName;
- (PBButtonProperty *(^)(NSString *backgroundImage))backgroudImageName;
- (PBButtonProperty *(^)(NSString *s_backgroundImage))selectBackgroudImageName;
- (PBButtonProperty *(^)(UIColor *backgroudColor))backgroudColor;
- (PBButtonProperty *(^)(CGFloat cornerRadius))cornerRadius;
- (PBButtonProperty *(^)(id target,SEL action))targetAction;



@end


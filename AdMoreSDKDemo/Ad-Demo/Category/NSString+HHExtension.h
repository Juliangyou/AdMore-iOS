//
//  NSString+HHExtension.h
//  iOSDevelopSDK
//
//  Created by Hayder on 2019/6/13.
//  Copyright © 2019 Hayder. All rights reserved.
//

#define isBlank(string) [NSString isBlank:string]
#define isNotBlank(string) [NSString isNotBlank:string]
#import <UIKit/UIKit.h>

@interface NSString (HHExtension)

/** 根据宽度获取高度*/
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

/**
 创建富文本
 */
-(NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing

                                           textColor:(UIColor *)textcolor

                                            textFont:(UIFont *)font;
/**计算富文本高度，linespace 5**/
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;


/** 根据高度获取宽 */
- (CGFloat)boundingWidthWithHeight:(CGFloat)height font:(UIFont *)font;

/**字符串截取*/
- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString;

/**去除前后空格*/
- (NSString *)trim;

/**判断字符串是否全为空格   yes表示全为 no表示不是*/
- (BOOL)isBlankCharacter;

/**是否全是数字*/
- (BOOL)validateNumber;

/**计算当前文件\文件夹的内容大小*/
- (NSInteger)fileSize;

/** 获取字符串的字符长度*/
- (int)convertToByte;

#pragma mark ---------------------正则判断----------------------------
//是否是浮点型
- (BOOL)isPureFloatStr;
//邮箱
- (BOOL)isEmail;
//手机
- (BOOL)isMobile;
//身份证
- (BOOL)isIdentityCard;
//密码强弱
-(BOOL)weakPswd;
//字母和数字
- (BOOL)isOnlyAlphaNumeric;

//只有字母
- (BOOL)isOnlyLetters;
//只有数字
- (BOOL)isOnlyNumbers;

+ (BOOL)JudgeTheillegalCharacter:(NSString *)content;

+ (BOOL)isNotBlank:(NSString *)string;
+ (BOOL)isBlank:(NSString *)string;

+ (NSString *)handlePhoneNum:(NSString *)phoneNum;

/**
 字符串不够补0
 */
- (NSString*)CharacterStringAddDigit:(int)AddDigit AddString:(NSString*)AddString;

/*
 * 字符串转字典（NSString转Dictionary）
 *   parameter
 *     turnString : 需要转换的字符串
 */
+ (NSDictionary *)turnStringToDictionary:(NSString *)turnString;

/**
 去除Html标签
 */
- (NSString *)filterhtml;

/**
 将秒转成00:00
 */
+ (NSString *)covertSecondToTimeSting:(NSInteger)secCount;

/**
 将htmlstring 转成 属性字符串
 */
- (NSAttributedString *)htmlStingToAttributedString;

/**
 设置行间距
 */
- (NSMutableAttributedString *)setTextLineSpacing:(CGFloat)lineSpacing;

@end

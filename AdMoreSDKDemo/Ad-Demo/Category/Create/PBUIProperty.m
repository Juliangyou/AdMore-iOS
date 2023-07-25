//
//  PBUIProperty.m
//  PayBox
//
//  Created by Hayder on 2022/2/8.
//

#import "PBUIProperty.h"

@implementation PBButtonProperty

+ (instancetype)property
{
    return [[PBButtonProperty alloc] init];
}



+ (PBButtonProperty *(^)(void))init
{
    return ^(){
        PBButtonProperty *property = [[PBButtonProperty alloc] init];
            return property;
        };
}

- (PBButtonProperty *(^)(CGRect frame))frame
{
    return ^(CGRect frame){
            self.pbframe = frame;
            return self;
        };
}
- (PBButtonProperty *(^)(NSString *title))title
{
    return ^(NSString *title){
            self.pbTitle = title;
            return self;
        };
}
- (PBButtonProperty *(^)(UIColor *titleColor))titleColor
{
    return ^(UIColor *titleColor){
            self.pbTitleColor = titleColor;
            return self;
        };
}
- (PBButtonProperty *(^)(NSString *s_title))selectedTitle
{
    return ^(NSString *s_title){
            self.pb_s_title = s_title;
            return self;
        };
}
- (PBButtonProperty *(^)(UIColor *s_titleColor))selectedTitleColor
{
    return ^(UIColor *s_titleColor){
            self.pb_s_titleColor = s_titleColor;
            return self;
        };
}
- (PBButtonProperty *(^)(CGFloat fontSize))fontSize
{
    return ^(CGFloat fontSize){
            self.pbFontSize = fontSize;
            return self;
        };
}

- (PBButtonProperty *(^)(NSString *imageName))imageName
{
    return ^(NSString *imageName){
            self.pbimageName = imageName;
            return self;
        };
}

- (PBButtonProperty *(^)(NSString *s_imageName))selectedImageName
{
    return ^(NSString *s_imageName){
            self.pb_s_imageName = s_imageName;
            return self;
        };
}
- (PBButtonProperty *(^)(NSString *backgroundImage))backgroudImageName
{
    return ^(NSString *backgroundImage){
            self.pbBackgroundImage = backgroundImage;
            return self;
        };
}
- (PBButtonProperty *(^)(NSString *s_backgroundImage))selectBackgroudImageName
{
    return ^(NSString *s_backgroundImage){
            self.pb_s_backgroundImage = s_backgroundImage;
            return self;
        };
}

- (PBButtonProperty *(^)(UIColor *backgroudColor))backgroudColor
{
    return ^(UIColor *backgroudColor){
            self.pbBackgroudColor = backgroudColor;
            return self;
        };
}

- (PBButtonProperty *(^)(CGFloat cornerRadius))cornerRadius
{
    return ^(CGFloat cornerRadius){
            self.pbCornerRadius = cornerRadius;
            return self;
        };
}

- (PBButtonProperty *(^)(id target,SEL action))targetAction
{
    return ^(id target,SEL action){
            self.pbtarget = target;
            self.pbaction = action;
            return self;
        };
}


@end

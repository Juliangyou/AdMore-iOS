//
//  HHLabelProperty.m
//  Smart
//
//  Created by Hayder on 2022/12/20.
//

#import "HHLabelProperty.h"

@implementation HHLabelProperty

+ (HHLabelProperty *(^)(void))init
{
    return ^(){
        HHLabelProperty *property = [[HHLabelProperty alloc] init];
            return property;
        };
}
- (HHLabelProperty *(^)(CGRect frame))frame
{
    return ^(CGRect frame){
            self.hhframe = frame;
            return self;
        };
}
- (HHLabelProperty *(^)(NSString *text))text
{
    return ^(NSString *text){
        self.hhtext = text;
        return self;
    };
}

- (HHLabelProperty *(^)(CGFloat fontSize))fontSize
{
    return ^(CGFloat fontSize){
        self.hhfontSize = fontSize;
        return self;
    };
}
- (HHLabelProperty *(^)(CGFloat boldFontSize))boldFontSize
{
    return ^(CGFloat boldFontSize){
        self.hhBoldfontSize = boldFontSize;
        return self;
    };
}
- (HHLabelProperty *(^)(UIColor *textColor))textColor
{
    return ^(UIColor *textColor){
        self.hhtextColor = textColor;
        return self;
    };
}
- (HHLabelProperty *(^)(NSTextAlignment textAlignment))textAlignment
{
    return ^(NSTextAlignment textAlignment){
        self.hhtextAlignment = textAlignment;
        return self;
    };
}

- (HHLabelProperty *(^)(UIColor *backgroundColor))backgroundColor
{
    return ^(UIColor *backgroundColor){
            self.hhbackgroundColor = backgroundColor;
            return self;
        };
}

- (HHLabelProperty *(^)(NSInteger numberOfLines))numberOfLines
{
    return ^(NSInteger numberOfLines){
            self.hhnumberOfLines = numberOfLines;
            return self;
        };
}


- (HHLabelProperty *(^)(CGFloat cornerRadius))CornerRadius;
{
    return ^(CGFloat cornerRadius){
            self.hhCornerRadius = cornerRadius;
            return self;
        };
}

@end

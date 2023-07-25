//
//  UIButton+Create.m
//  PayBox
//
//  Created by Hayder on 2022/2/8.
//

#import "UIButton+Create.h"
#import "AdMoreGlobalDefine.h"
@implementation UIButton (Create)

+ (UIButton *)buttonWithUIProperty:(PBButtonProperty *)bp
{
    return [self buttonWithFrame:bp.pbframe
                     NormalTitle:bp.pbTitle
                NormalTitleColor:bp.pbTitleColor
                   SelectedTitle:bp.pb_s_title
              selectedTitleColor:bp.pb_s_titleColor
                        FontSize:bp.pbFontSize
                 NormalImageName:bp.pbimageName
               SelectedImageName:bp.pb_s_imageName
                  backgroudColor:bp.pbBackgroudColor
             backgroundImageName:bp.pbBackgroundImage
     backgroundSelectedImageName:bp.pb_s_backgroundImage
                    cornerRadius:bp.pbCornerRadius
                          target:bp.pbtarget
                        selector:bp.pbaction];
}

+ (UIButton *)buttonWithFrame:(CGRect)frame
                   NormalTitle:(NSString *)text
                   NormalTitleColor:(UIColor *)textColor
                   SelectedTitle:(NSString *) selectedText
                   selectedTitleColor:(UIColor *)s_textColor
                   FontSize:(CGFloat)fontSize
                   NormalImageName:(NSString *)imageName
                   SelectedImageName:(NSString *)selectedImageName
                   backgroudColor:(UIColor *)bgcolor
                   backgroundImageName:(NSString *)bgImageName
                   backgroundSelectedImageName:(NSString *)s_bgImageName
                   cornerRadius:(CGFloat)cornerRadius
                   target:(id) target
                   selector:(SEL)selector
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.adjustsImageWhenHighlighted = NO;
    if (text) {
        [button setTitle:text forState:UIControlStateNormal];
    }
    
    if (textColor) {
        [button setTitleColor:textColor forState:UIControlStateNormal];
    }
    
    
    if (selectedText) {
        [button setTitle:selectedText forState:UIControlStateSelected];
    }
    
    if (s_textColor) {
        [button setTitleColor:s_textColor forState:UIControlStateSelected];
    }
    
    if (fontSize != 0) {
        button.titleLabel.font = Font(fontSize);
    }
    
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (selectedImageName) {
        [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    
    if (bgcolor) {
        [button setBackgroundColor:bgcolor];
    }
    
    if (bgImageName) {
        [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    
    if (s_bgImageName) {
        [button setBackgroundImage:[UIImage imageNamed:s_bgImageName] forState:UIControlStateSelected];
    }
    
    if (cornerRadius != 0) {
        button.layer.cornerRadius = cornerRadius;
        button.layer.masksToBounds = YES;
    }
    
    if (target && selector) {
        [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}
@end

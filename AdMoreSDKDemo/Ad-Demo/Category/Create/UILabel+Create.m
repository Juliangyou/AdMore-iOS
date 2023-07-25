//
//  UILabel+Create.m
//  Smart
//
//  Created by Hayder on 2022/12/20.
//

#import "UILabel+Create.h"
#import "AdMoreGlobalDefine.h"
@implementation UILabel (Create)

+ (UILabel *)labelWithProperty:(HHLabelProperty *)lp
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = lp.hhframe;
    label.textAlignment = lp.hhtextAlignment;
    label.numberOfLines = lp.hhnumberOfLines;
    if(lp.hhtext)
    {
        label.text = lp.hhtext;
    }
    
    if(lp.hhfontSize !=0 )
    {
        label.font = Font(lp.hhfontSize);
    }
    
    if(lp.hhBoldfontSize !=0 )
    {
        label.font = BoldFont(lp.hhBoldfontSize);
    }
    
    if(lp.hhtextColor)
    {
        label.textColor = lp.hhtextColor;
    }
    
    if(lp.hhbackgroundColor)
    {
        label.backgroundColor = lp.hhbackgroundColor;
    }
    
    if(lp.hhCornerRadius != 0)
    {
        label.layer.cornerRadius = lp.hhCornerRadius;
        label.layer.masksToBounds = YES;
    }
    
    return label;
}
@end

//
//  UILabel+Create.h
//  Smart
//
//  Created by Hayder on 2022/12/20.
//

#import <UIKit/UIKit.h>
#import "HHLabelProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Create)

+ (UILabel *)labelWithProperty:(HHLabelProperty *)lp;

@end

NS_ASSUME_NONNULL_END

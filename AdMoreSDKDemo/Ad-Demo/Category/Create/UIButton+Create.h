//
//  UIButton+Create.h
//  PayBox
//
//  Created by Hayder on 2022/2/8.
//

#import <UIKit/UIKit.h>
#import "PBUIProperty.h"

@interface UIButton (Create)

+ (UIButton *)buttonWithUIProperty:(PBButtonProperty *)bp;

@end

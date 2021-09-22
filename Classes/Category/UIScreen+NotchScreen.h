//
//  UIScreen+NotchScreen.h
//  YBRenstore
//
//  Created by bdkj on 2021/3/16.
//  Copyright © 2021 BDKJ_Hbb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (NotchScreen)

///判断是否为刘海屏
+ (BOOL)isIPhoneNotchScreen;
 
///获得刘海屏的高度
+ (CGFloat)getIPhoneNotchScreenHeight;

@end

NS_ASSUME_NONNULL_END

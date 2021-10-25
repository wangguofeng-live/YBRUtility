//
//  UIDevice+Helper.h
//  YBRUtility
//
//  Created by bdkj on 2021/10/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Helper)

///当前设备型号
+ (NSString *_Nullable)iphoneType;

///震动反馈
+ (void)impactFeedback;

///打电话
+ (void)callToUserCellphone:(NSString*)argCellphone;

@end

NS_ASSUME_NONNULL_END

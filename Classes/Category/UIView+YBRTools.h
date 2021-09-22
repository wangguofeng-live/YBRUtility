//
//  UIView+YBRTools.h
//  YBRenstore
//
//  Created by bdkj on 2020/5/19.
//  Copyright © 2020 BDKJ_Hbb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YBRTools)

+ (UIViewController *)currentViewControllerWithView:(UIView *)view;

- (UIViewController *)viewController;

+ (UINavigationController *)currentNavigationControllerWithView:(UIView *)view;

- (UINavigationController *)navigationController;

@end

NS_ASSUME_NONNULL_END

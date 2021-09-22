//
//  UIView+YBRTools.m
//  YBRenstore
//
//  Created by bdkj on 2020/5/19.
//  Copyright © 2020 BDKJ_Hbb. All rights reserved.
//

#import "UIView+YBRTools.h"

@implementation UIView (YBRTools)

+ (UIViewController *)currentViewControllerWithView:(UIView *)view {
    UIResponder *nextResponder = view.nextResponder;
    while (![nextResponder isKindOfClass: [UIWindow class]]) {
        if ([nextResponder isKindOfClass: [UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
        nextResponder = nextResponder.nextResponder;
    }
    return nil;
}

- (UIViewController *)viewController {
    UIResponder *nextResponder = self.nextResponder;
    while (nextResponder != nil && ![nextResponder isKindOfClass: [UIWindow class]]) {
        if ([nextResponder isKindOfClass: [UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
        nextResponder = nextResponder.nextResponder;
    }
    return nil;
}

//- (UIViewController*)viewController {
//
//    for (UIView* next = [self superview]; next; next = next.superview) {
//
//        UIResponder* nextResponder = [next nextResponder];
//
//        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
//
//            return (UIViewController*)nextResponder;
//
//        }
//
//    }
//
//    return nil;
//
//}
//
//同理可获取当前控制器所在导航控制器
//
//- (UINavigationController*)viewController {
//
//    for (UIView* next = [self superview]; next; next = next.superview) {
//
//        UIResponder* nextResponder = [next nextResponder];
//
//        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
//
//            return (UINavigationController*)nextResponder;
//
//        }
//
//    }
//
//    return nil;
//
//}


+ (UINavigationController *)currentNavigationControllerWithView:(UIView *)view {
    UIResponder *nextResponder = view.nextResponder;
    while (![nextResponder isKindOfClass: [UIWindow class]]) {
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)nextResponder;
        }else if ([nextResponder isKindOfClass: [UIViewController class]] && ((UIViewController *)nextResponder).navigationController != nil) {
            
            return ((UIViewController *)nextResponder).navigationController;
        }
        nextResponder = nextResponder.nextResponder;
    }
    return nil;
}

- (UINavigationController *)navigationController {
    UIResponder *nextResponder = self.nextResponder;
    while (![nextResponder isKindOfClass: [UIWindow class]]) {
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)nextResponder;
        }else if ([nextResponder isKindOfClass: [UIViewController class]] && ((UIViewController *)nextResponder).navigationController != nil) {

            return ((UIViewController *)nextResponder).navigationController;
        }
        nextResponder = nextResponder.nextResponder;
    }
    return nil;
}

@end

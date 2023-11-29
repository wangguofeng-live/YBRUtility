//
//  NSURL+YBRTools.m
//  YBRenstore
//
//  Created by bdkj on 2020/9/16.
//  Copyright © 2020 BDKJ_Hbb. All rights reserved.
//

#import "NSURL+YBRTools.h"
#import <objc/runtime.h>

@implementation NSURL (YBRTools)

+ (void)initialize {
    // 下勾子
    /*
     SEL -- IMP(才是指针)
     */
    
    // 防止被别人手动调用，再次调换回来，所以要保证他只执行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method URLWithStringMethod = class_getClassMethod(self, @selector(URLWithString:));
        Method Hook_URLWithStringMethod = class_getClassMethod(self, @selector(hook_URLWithString:));
        
        method_exchangeImplementations(URLWithStringMethod, Hook_URLWithStringMethod);
//        // class_getClassMethod     获取类方法
//        // class_getInstanceMethod  获取对象方法
//        Method URLWithString = class_getClassMethod(self, @selector(URLWithString:));
//        Method hook_URLWithString = class_getClassMethod(self, @selector(hook_URLWithString:));
//        // 交换方法
//        method_exchangeImplementations(URLWithString, hook_URLWithString);
        
    });
    
}

+(instancetype)hook_URLWithString:(NSString *)URLString {
    
    if (@available(iOS 17.0, *)) {
        return [self hook_URLWithString:URLString];;
    } else {
        
        static NSCharacterSet *charSet = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSMutableCharacterSet *mutableCharSet = [[NSMutableCharacterSet alloc] init];
            [mutableCharSet formUnionWithCharacterSet:[NSCharacterSet letterCharacterSet]];
            [mutableCharSet addCharactersInString:@",.:/=?&%#+-_()"];
            [mutableCharSet addCharactersInString:@"0123456789"];
            charSet = mutableCharSet.copy;
        });
        
        // 两个方法实现已经调换了，所以这里要调用hook_URLWithString，如果调用URLWithString的会造成递归
        //    NSString *urlM = [URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *urlM = [URLString stringByAddingPercentEncodingWithAllowedCharacters:charSet];
        NSURL *url = [NSURL hook_URLWithString:urlM];
        if (!url) {
            NSLog(@"url为nil");
        }
        
        return url;
    }
}

@end

//
//  YBREventsManager.h
//  YBRPluggableDemo
//
//  Created by bdkj on 2021/7/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YBREventsManager : NSObject

+ (instancetype)sharedInstance;

///订阅事件（selector）
- (void)subscribeEvent:(NSString *)eventName object:(id)object selector:(SEL)selector;
///订阅事件（block）
- (void)subscribeEvent:(NSString *)eventName object:(id)object block:(void (^)(id event))block;

///取消订阅事件
- (void)unsubscribeEvent:(NSString *)eventName object:(id)object;

///发布事件
- (void)fireEvent:(NSString *)eventName;
- (void)fireEvent:(NSString *)eventName module:moduleId;
- (void)fireEvent:(NSString *)eventName module:moduleId params:params;

@end

NS_ASSUME_NONNULL_END

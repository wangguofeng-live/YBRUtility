//
//  NSObject+YBREvents.m
//  YBRPluggableDemo
//
//  Created by bdkj on 2021/7/27.
//

#import "NSObject+YBREvents.h"
#import "YBREventsManager.h"


@implementation NSObject (YBREvents)

- (void)subscribeEvent:(NSString *)eventName {
    [self subscribeEvent:eventName object:self];
}

- (void)subscribeEvent:(NSString *)eventName object:(id)object {
    [[YBREventsManager sharedInstance] subscribeEvent:eventName object:object selector:@selector(receiveYBREvent:)];
}

//订阅事件
- (void)subscribeEvent:(NSString *)eventName object:(id)object selector:(SEL)selector {
    [[YBREventsManager sharedInstance] subscribeEvent:eventName object:object selector:selector];
}

//订阅事件（block）
- (void)subscribeEvent:(NSString *)eventName object:(id)object block:(void (^)(id event))block {
    [[YBREventsManager sharedInstance] subscribeEvent:eventName object:object block:block];
}

///取消订阅事件
- (void)unsubscribeEvent:(NSString *)eventName object:(id)object {
    [[YBREventsManager sharedInstance] unsubscribeEvent:eventName object:object];
}

//发布事件
- (void)fireEvent:(NSString *)eventName {
    [[YBREventsManager sharedInstance] fireEvent:eventName];
}

- (void)fireEvent:(NSString *)eventName module:moduleId {
    [[YBREventsManager sharedInstance] fireEvent:eventName module:moduleId];
}

- (void)fireEvent:(NSString *)eventName module:moduleId params:params {
    [[YBREventsManager sharedInstance] fireEvent:eventName module:moduleId params:params];
}

//事件接收默认实现
- (void)receiveYBREvent:(YBREvent *)event {}

@end

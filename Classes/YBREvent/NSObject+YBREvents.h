//
//  NSObject+YBREvents.h
//  YBRPluggableDemo
//
//  Created by bdkj on 2021/7/27.
//

#import <Foundation/Foundation.h>
#import "YBREvent.h"

NS_ASSUME_NONNULL_BEGIN

/// YBREvents 事件机制辅助套件
@interface NSObject (YBREvents)

/**
 订阅事件（回调方法 -[receiveYBREvent:]）
 object 事件响应者 （self）
 */
- (void)subscribeEvent:(NSString *)eventName;

/**
 订阅事件（回调方法 -[receiveYBREvent:]）
 object 事件响应者
 */
- (void)subscribeEvent:(NSString *)eventName object:(id)object;

/**
 订阅事件
 object 事件响应者
 selector 事件响应方法
 */
- (void)subscribeEvent:(NSString *)eventName object:(id)object selector:(SEL)selector;

//发布事件
- (void)fireEvent:(NSString *)eventName;

- (void)fireEvent:(NSString *)eventName module:moduleId;

- (void)fireEvent:(NSString *)eventName module:moduleId params:params;

/**
 接收事件方法
 使用 -[registerEvent:object:] 订阅事件
 */
- (void)receiveYBREvent:(YBREvent *)event;

@end

NS_ASSUME_NONNULL_END

//
//  YBREventsManager.m
//  YBRPluggableDemo
//
//  Created by bdkj on 2021/7/27.
//

#import "YBREventsManager.h"
#import "YBREvent.h"

#define CancelPerformSelectorLeakWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)


@interface YBREventsManager ()

/*
 事件集合
 EventMap结构：<key:事件订阅者，value:该订阅者订阅的事件集合 EventNameDic >
 EventNameDic结构：<key:EventName，value:响应事件列表 SelectorList >
 */
@property (nonatomic,strong)NSMapTable<id,NSMutableDictionary *> *eventMap;

@end

@implementation YBREventsManager

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static YBREventsManager * __singleton__;
    dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } );
    return __singleton__;
}

//订阅事件（selector）
- (void)subscribeEvent:(NSString *)eventName object:(id)object selector:(SEL)selector {
    [self _subscribeEventEvent:eventName object:object selector:selector];
}

//订阅事件（block）
- (void)subscribeEvent:(NSString *)eventName object:(id)object block:(nonnull void (^)(id _Nonnull))block {
    [self _subscribeEventEvent:eventName object:object block:block];
}

//取消订阅事件
- (void)unsubscribeEvent:(NSString *)eventName object:(id)object {
    [self _unsubscribeEventEvent:eventName object:object];
}

//发布事件
- (void)fireEvent:(NSString *)eventName {
    [self fireEvent:eventName module:nil params:nil];
}
- (void)fireEvent:(NSString *)eventName module:moduleId {
    [self fireEvent:eventName module:moduleId params:nil];
}

- (void)fireEvent:(NSString *)eventName module:moduleId params:params {
    [self dispatchEvent:eventName module:moduleId params:params];
}

//分发事件
- (void)dispatchEvent:(NSString *)eventName module:moduleId params:params {
    
    //1.遍历EventMap
    NSMapEnumerator    enumerator;
    void *key, *value;
    
    enumerator = NSEnumerateMapTable(self.eventMap);
    
    
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value)) {

        id object = (__bridge id)(key);
        NSDictionary *eventNameDict = (__bridge NSDictionary *)value;
        
        //2.查找对应EventName的 SelectorList
        NSArray *selectorList = [eventNameDict objectForKey:eventName];
        
        //3.遍历SelectorList
        for (id action in selectorList) {
            //4.检查类型
            if ([action isKindOfClass:[NSString class]]) {
                NSString *sel = action;
                
                //5.1 检查object的实现，并执行
                SEL selector = NSSelectorFromString(sel);
                if ([object respondsToSelector:selector]) {
                    YBREvent *event = [YBREvent new];
                    event.eventName = eventName;
                    event.params = params;
                    CancelPerformSelectorLeakWarning ([object performSelector:selector withObject:event];);
                }
                
            }else {
                void (^block)(id event) = action;
                
                //5.2 检查object的实现，并执行
                YBREvent *event = [YBREvent new];
                event.eventName = eventName;
                event.params = params;
                block(event);
                
            }
            
        }

    }
    NSEndMapTableEnumeration(&enumerator);
}

#pragma mark - eventMap 操作

///订阅事件（selector）
- (void)_subscribeEventEvent:(NSString *)eventName object:(id)object selector:(SEL)selector {
    if (eventName == nil) return;
    if (object == nil) return;
    if (selector == nil) return;
    
    //1.准备 EventNameDict
    NSMutableDictionary *eventNameDict = [self.eventMap objectForKey:object];
    if (nil == eventNameDict) {
        eventNameDict = [NSMutableDictionary dictionary];
        [self.eventMap setObject:eventNameDict forKey:object];
    }
    
    //2.准备 SelectorList
    NSMutableArray *selectorList = [eventNameDict objectForKey:eventName];
    if (nil == selectorList) {
        selectorList = [NSMutableArray array];
        [eventNameDict setObject:selectorList forKey:eventName];
    }
    
    //3.添加 SEL
    NSString *sel = NSStringFromSelector(selector);
    if (![selectorList containsObject:sel]) {
        [selectorList addObject:sel];
    }
    
}

///订阅事件（block）
- (void)_subscribeEventEvent:(NSString *)eventName object:(id)object block:(void (^)(id event))block {
    if (eventName == nil) return;
    if (object == nil) return;
    if (block == nil) return;
    
    //1.准备 EventNameDict
    NSMutableDictionary *eventNameDict = [self.eventMap objectForKey:object];
    if (nil == eventNameDict) {
        eventNameDict = [NSMutableDictionary dictionary];
        [self.eventMap setObject:eventNameDict forKey:object];
    }
    
    //2.准备 SelectorList
    NSMutableArray *selectorList = [eventNameDict objectForKey:eventName];
    if (nil == selectorList) {
        selectorList = [NSMutableArray array];
        [eventNameDict setObject:selectorList forKey:eventName];
    }
    
    //3.添加 block
    [selectorList addObject:block];
    
}

///取消订阅事件
- (void)_unsubscribeEventEvent:(NSString *)eventName object:(id)object {
    if (eventName == nil) return;
    if (object == nil) return;
    
    [self.eventMap removeObjectForKey:object];
    
    //1.准备 EventNameDict
    NSMutableDictionary *eventNameDict = [self.eventMap objectForKey:object];
    if (nil == eventNameDict) {
        eventNameDict = [NSMutableDictionary dictionary];
        [self.eventMap setObject:eventNameDict forKey:object];
    }
    
    //2.移除 EventName
    [eventNameDict removeObjectForKey:eventName];
    
}

- (NSMapTable *)eventMap {
    if (!_eventMap) {
        _eventMap = [NSMapTable weakToStrongObjectsMapTable];
    }
    return _eventMap;
}

@end

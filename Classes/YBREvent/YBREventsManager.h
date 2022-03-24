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

///订阅事件
- (void)subscribeEvent:(NSString *)eventName object:(id)object selector:(SEL)selector;

///发布事件
- (void)fireEvent:(NSString *)eventName;
- (void)fireEvent:(NSString *)eventName module:moduleId;
- (void)fireEvent:(NSString *)eventName module:moduleId params:params;

@end

NS_ASSUME_NONNULL_END

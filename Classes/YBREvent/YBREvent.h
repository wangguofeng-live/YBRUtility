//
//  YBREvent.h
//  YBRPluggableDemo
//
//  Created by bdkj on 2021/7/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YBREvent : NSObject

///事件名
@property (nonatomic,copy)NSString *eventName;

///事件参数
@property (nonatomic,strong)id params;

///返回值(可选)
@property (nonatomic,strong)id responseInfo;

@end

NS_ASSUME_NONNULL_END

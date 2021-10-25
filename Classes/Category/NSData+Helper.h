//
//  NSData+Helper.h
//  YBRUtility
//
//  Created by bdkj on 2021/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Helper)

//通过图片Data数据第一个字节 来获取图片扩展名
+ (NSString *)contentTypeForImageData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END

//
//  NSDictionary+YBRDictionary.h
//  YBRenstore
//
//  Created by BDKJ_IOS on 2017/2/27.
//  Copyright © 2017年 BDKJ_Hbb. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (YBRDictionary)

- (nonnull id)objectForKeyCheckStr:(nullable id)aKey;

/**
 * 根据key 提取value
 * 如果是array 则返回，否则返回nil
 */
- (nonnull NSArray *)arrayForKeyAndCheckValue:(nullable id)aKey;

/**
 * 根据key 提取value
 * 如果是dictionary 则返回，否则返回nil
 */
- (nonnull NSDictionary *)dictionaryForKeyAndCheckValue:(nullable id)aKey;


- (nonnull id)stringForKeyCheckStr:(nullable id)aKey;

#pragma mark json解析

+ (NSDictionary *_Nullable)dictionaryWithJsonString:(NSString *_Nullable)jsonString;

+ (NSString *_Nullable)arrayToJSONString:(nullable NSArray *)array;

+ (NSString *_Nullable)convertToJsonData:(nullable NSDictionary *)dict;

@end

@interface NSDictionary (KeyFirstChar)

///转化所有Key的首字母改为大写的 Dic
- (NSDictionary * _Nonnull)convertToKeyFirstCharUpperDictionary;

///转化所有Key的首字母改为小写的 Dic
- (NSDictionary *_Nonnull)convertToKeyFirstCharLowerDictionary;

@end

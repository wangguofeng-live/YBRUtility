//
//  NSDictionary+YBRDictionary.m
//  YBRenstore
//
//  Created by BDKJ_IOS on 2017/2/27.
//  Copyright © 2017年 BDKJ_Hbb. All rights reserved.
//

#import "NSDictionary+YBRDictionary.h"
#import "YBRToolsMacro.h"
#import "NSString+Helper.h"

@implementation NSDictionary (YBRDictionary)
- (id)objectForKeyCheckStr:(id)aKey
{
    id strValue;
    strValue = [self objectForKey:aKey];
    if (!strValue || [strValue isKindOfClass:[NSNull class]]) {
        strValue = @"";
    }else if ([strValue isKindOfClass:[NSNumber class]]) {
        strValue = [strValue description];
    }
    return strValue;
}

- (NSArray *)arrayForKeyAndCheckValue:(id)aKey
{
    id value = [self objectForKey:aKey];
    return YBR_IS_ARRAY(value) ? value : nil;
}

- (NSDictionary *)dictionaryForKeyAndCheckValue:(id)aKey
{
    id value = [self objectForKey:aKey];
    return YBR_IS_DICT(value) ? value : nil;
}

- (id)stringForKeyCheckStr:(id)aKey
{
    return [[self objectForKeyCheckStr:aKey] description];
}

#pragma mark json解析
/**
 @brief json转字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        return nil;
    }
    return dic;
}
/**
 @brief 字典转json
 */
+(NSString *)convertToJsonData:(NSDictionary *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

+ (NSString *)arrayToJSONString:(NSArray *)array
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end


@implementation NSDictionary (KeyFirstChar)

///转化所有Key的首字母改为大写的 Dic
- (NSDictionary *)convertToKeyFirstCharUpperDictionary {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSString *key in self.allKeys) {
        
        id obj = self[key];
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            obj = [((NSDictionary *)obj) convertToKeyFirstCharUpperDictionary];
        }
        
        [dic setObject:obj forKey:[key ybr_firstCharUpper]];
    }
    return dic.copy;
}

///转化所有Key的首字母改为小写的 Dic
- (NSDictionary *)convertToKeyFirstCharLowerDictionary {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSString *key in self.allKeys) {
        
        id obj = self[key];
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            obj = [((NSDictionary *)obj) convertToKeyFirstCharLowerDictionary];
        }
        
        [dic setObject:obj forKey:[key ybr_firstCharLower]];
    }
    return dic.copy;
}

@end

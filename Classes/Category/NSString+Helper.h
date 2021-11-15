//
//  NSString+Helper.h
//  YBRenstore
//
//  Created by bb.huang on 2019/1/19.
//  Copyright © 2019 BDKJ_Hbb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Helper)

-(NSString *)replaceStringBlank;//去除字符串中的空白

- (NSString *)timeStampConverToTimeStr;//时间戳改日期

+ (NSString*)noNullString:(NSString*)sender;

/**
 @brief 复制粘贴文案
 */
+ (void)Pasteboard:(NSString*)argPasteboard;

//判断手机号码格式是否正确
+ (BOOL)judgeMobile:(NSString *)mobile;

/**
 @brief 判断银行卡号是否正确
 */
+ (BOOL)checkCardNo:(NSString*) cardNo;

@end

@interface NSString (CheckNumber)

- (BOOL)isAllNumber;

@end

#pragma mark - string size
@interface NSString (StringSize)

+ (CGSize)GetControlSizewithWidth:(CGFloat)p_SizeWidth
                       withString:(NSString *)str_textString
                         withFont:(UIFont *)font;

+ (CGSize)GetControlSizewithWidth:(CGFloat)p_SizeWidth
                      lineSpacing:(CGFloat)argSpacing
                       withString:(NSString *)str_textString
                         withFont:(UIFont *)font;

+ (CGSize)GetControlSizewithNoLineSpacing:(CGFloat)p_SizeWidth
                               withString:(NSString *)str_textString
                                 withFont:(UIFont *)font;

+ (CGSize)GetControlNoLineSpacingSizewithWidth:(CGFloat)p_SizeWidth
                                    withString:(NSString *)str_textString
                                      withFont:(UIFont *)font;

@end

#pragma mark - md5
@interface NSString (MD5)

+ (NSString*)getMd5_32Bit_String:(NSString *)srcString;

@end

#pragma mark - unicode
@interface NSString (Unicode)

+ (NSString *_Nullable)stringDecode:(NSString *_Nullable)sender;

+ (NSString *_Nullable)stringEncode:(NSString *_Nullable)sender;

#pragma json check
///初步判断是否为JSON String
+ (BOOL)isJsonStringFast:(NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END

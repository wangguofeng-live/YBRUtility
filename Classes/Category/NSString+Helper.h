//
//  NSString+Helper.h
//  YBRenstore
//
//  Created by bb.huang on 2019/1/19.
//  Copyright © 2019 BDKJ_Hbb. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
 
 __attribute__ ((weak)) UIFont* YBRRegularFont(int fontSize) {
    return [UIFont systemFontOfSize:fontSize];
}

@interface NSString (Helper)

-(NSString *)replaceStringBlank;//去除字符串中的空白

- (NSString *)timeStampConverToTimeStr;//时间戳改日期

+ (NSString*)noNullString:(NSString*)sender;

/**
 @brief 复制粘贴文案
 */
+ (void)Pasteboard:(NSString*)argPasteboard;

@end

@interface NSString (CheckNumber)

- (BOOL)isAllNumber;

@end

#pragma mark - string size
@interface NSString (StringSize)

+ (CGSize)GetControlSizewithWidth:(CGFloat)p_SizeWidth
                       withString:(NSString *)str_textString
                         withFont:(int)n_Font;

+ (CGSize)GetControlSizewithWidth:(CGFloat)p_SizeWidth
                   withHtmlString:(NSString *)strHtmlString
                         withFont:(int)n_Font;

+ (CGSize)GetControlSizewithWidth:(CGFloat)p_SizeWidth
                      lineSpacing:(CGFloat)argSpacing
                       withString:(NSString *)str_textString
                         withFont:(int)n_Font;

//- (CGSize)GetControlRectWithWidth:(CGFloat)argRectWidth
//                      lineSpacing:(CGFloat)argSpacing
//             withAttributedString:(NSAttributedString *)strAttributedString
//                             font:(int)argFont;

+ (CGSize)GetControlSizewithNoLineSpacing:(CGFloat)p_SizeWidth
                               withString:(NSString *)str_textString
                                 withFont:(int)n_Font;

+ (CGSize)GetControlNoLineSpacingSizewithWidth:(CGFloat)p_SizeWidth
                                    withString:(NSString *)str_textString
                                      withFont:(int)n_Font;

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

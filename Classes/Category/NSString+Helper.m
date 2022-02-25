//
//  NSString+Helper.m
//  YBRenstore
//
//  Created by bb.huang on 2019/1/19.
//  Copyright © 2019 BDKJ_Hbb. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

-(NSString *)replaceStringBlank{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}
- (NSString *)timeStampConverToTimeStr{
    double dTimeStamp = [self doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:dTimeStamp];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (NSString*)noNullString:(NSString*)sender
{
    return sender ?: @"";
}

/**
 @brief 复制粘贴文案
 */
+ (void)Pasteboard:(NSString*)argPasteboard
{
    if (![argPasteboard isKindOfClass:[NSString class]]) return;
    UIPasteboard *pPasteboard = [UIPasteboard generalPasteboard];
    [pPasteboard setString:argPasteboard];
}

//判断手机号码格式是否正确
+ (BOOL)judgeMobile:(NSString *)mobile
{
    if (!mobile) {
        return NO;
    }
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else
    {
        return YES;
    }
}

/**
 @brief 判断银行卡号是否正确
 */
+ (BOOL)checkCardNo:(NSString*) cardNo{
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

//判断是否有系统表情
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    // 过滤所有表情。returnValue为NO表示不含有表情，YES表示含有表情
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        
        const unichar hs = [substring characterAtIndex:0];
        // surrogate pair
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
    }];
    return returnValue;
}

@end


@implementation NSString (CheckNumber)

- (BOOL)isAllNumber {
    
    NSString *PHONE_NUM = @"^[0-9]*$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHONE_NUM];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isPureInt
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}


@end

#pragma mark - string size
@implementation NSString (StringSize)

+ (CGSize)GetControlSizewithWidth:(CGFloat)p_SizeWidth
                      lineSpacing:(CGFloat)argSpacing
                       withString:(NSString *)str_textString
                         withFont:(UIFont *)font
{
    if (str_textString){
        CGSize p_Constraint = CGSizeMake(p_SizeWidth, 20000.0f);
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = argSpacing;// 字体的行间距
        NSDictionary *dic_attributes = @{
            NSFontAttributeName:font,
            NSParagraphStyleAttributeName:paragraphStyle
        };
        NSAttributedString *str_attributedText = [[NSAttributedString alloc] initWithString:str_textString attributes:dic_attributes];
        CGRect p_Rect = [str_attributedText boundingRectWithSize:p_Constraint options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil];
        return p_Rect.size;
    }
    else
        return CGSizeZero;
}

+ (CGSize)GetControlSizewithWidth:(CGFloat)p_SizeWidth
                       withString:(NSString *)str_textString
                         withFont:(nonnull UIFont *)font {
    if (str_textString){
        CGSize p_Constraint = CGSizeMake(p_SizeWidth, 20000.0f);
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5;// 字体的行间距
        NSDictionary *dic_attributes = @{
            NSFontAttributeName:font,
            NSParagraphStyleAttributeName:paragraphStyle
        };
        NSAttributedString *str_attributedText = [[NSAttributedString alloc] initWithString:str_textString attributes:dic_attributes];
        CGRect p_Rect = [str_attributedText boundingRectWithSize:p_Constraint options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        return p_Rect.size;
    }
    else
        return CGSizeZero;
}

+ (CGSize)GetControlNoLineSpacingSizewithWidth:(CGFloat)p_SizeWidth
                                    withString:(NSString *)str_textString
                                      withFont:(nonnull UIFont *)font
{
    if (str_textString){
        CGSize p_Constraint = CGSizeMake(p_SizeWidth, 20000.0f);
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        NSDictionary *dic_attributes = @{
            NSFontAttributeName:font,
            NSParagraphStyleAttributeName:paragraphStyle
        };
        NSAttributedString *str_attributedText = [[NSAttributedString alloc] initWithString:str_textString attributes:dic_attributes];
        CGRect p_Rect = [str_attributedText boundingRectWithSize:p_Constraint options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        return p_Rect.size;
    }
    else
        return CGSizeZero;
}

+ (CGSize)GetControlSizewithNoLineSpacing:(CGFloat)p_SizeWidth
                               withString:(NSString *)str_textString
                                 withFont:(nonnull UIFont *)font
{
    if (str_textString){
        CGSize p_Constraint = CGSizeMake(p_SizeWidth, 20000.0f);
        NSDictionary *dic_attributes = @{
            NSFontAttributeName:font
        };
        if ([str_textString isKindOfClass:[NSNull class]]) {
            str_textString = @"";
        }
        NSAttributedString *str_attributedText = [[NSAttributedString alloc] initWithString:str_textString attributes:dic_attributes];
        CGRect p_Rect = [str_attributedText boundingRectWithSize:p_Constraint options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        return p_Rect.size;
    }
    else
        return CGSizeZero;
}

@end


#pragma mark - md5
#import<CommonCrypto/CommonDigest.h>
@implementation NSString (MD5)

+ (NSString*)getMd5_32Bit_String:(NSString *)srcString{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH *2];
    for(int i =0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

@end

@implementation NSString (Unicode)

#pragma 字符串Decode
/**
 @brief 解码
 */
+ (NSString *)stringDecode:(NSString *)sender {
    
    return [sender stringByRemovingPercentEncoding];
}
/**
 @brief 编码
 */
+ (NSString *)stringEncode:(NSString *)sender
{
    return [sender stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

#pragma json check
+ (BOOL)isJsonStringFast:(NSString *)jsonString {
    if (jsonString.length < 2) return NO;
    if (!([jsonString hasPrefix:@"{"] || [jsonString hasPrefix:@"["])) return NO;
    // {:123  }:125  [: 91  ]:93
    return [jsonString characterAtIndex:jsonString.length-1]-[jsonString characterAtIndex:0] == 2;
}

@end

@implementation NSString (URL)

- (NSURL *)converToURL {
    //    [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./:;=?@_~%#[]"]];
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored"-Wdeprecated-declarations"
        return [NSURL URLWithString:(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,kCFStringEncodingUTF8))];
    #pragma clang diagnostic pop
}

@end

@implementation NSString (FirstChar)

- (NSString *)ybr_underlineFromCamel
{
    if (self.length == 0) return self;
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger i = 0; i<self.length; i++) {
        unichar c = [self characterAtIndex:i];
        NSString *cString = [NSString stringWithFormat:@"%c", c];
        NSString *cStringLower = [cString lowercaseString];
        if ([cString isEqualToString:cStringLower]) {
            [string appendString:cStringLower];
        } else {
            [string appendString:@"_"];
            [string appendString:cStringLower];
        }
    }
    return string;
}

- (NSString *)ybr_camelFromUnderline
{
    if (self.length == 0) return self;
    NSMutableString *string = [NSMutableString string];
    NSArray *cmps = [self componentsSeparatedByString:@"_"];
    for (NSUInteger i = 0; i<cmps.count; i++) {
        NSString *cmp = cmps[i];
        if (i && cmp.length) {
            [string appendString:[NSString stringWithFormat:@"%c", [cmp characterAtIndex:0]].uppercaseString];
            if (cmp.length >= 2) [string appendString:[cmp substringFromIndex:1]];
        } else {
            [string appendString:cmp];
        }
    }
    return string;
}

- (NSString *)ybr_firstCharLower
{
    if (self.length == 0) return self;
    NSMutableString *string = [NSMutableString string];
    [string appendString:[NSString stringWithFormat:@"%c", [self characterAtIndex:0]].lowercaseString];
    if (self.length >= 2) [string appendString:[self substringFromIndex:1]];
    return string;
}

- (NSString *)ybr_firstCharUpper
{
    if (self.length == 0) return self;
    NSMutableString *string = [NSMutableString string];
    [string appendString:[NSString stringWithFormat:@"%c", [self characterAtIndex:0]].uppercaseString];
    if (self.length >= 2) [string appendString:[self substringFromIndex:1]];
    return string;
}

@end


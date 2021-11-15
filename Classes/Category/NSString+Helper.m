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

@end


@implementation NSString (CheckNumber)

- (BOOL)isAllNumber {
    
    NSString *PHONE_NUM = @"^[0-9]*$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHONE_NUM];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
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


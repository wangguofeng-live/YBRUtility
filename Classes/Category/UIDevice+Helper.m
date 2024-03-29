//
//  UIDevice+Helper.m
//  YBRUtility
//
//  Created by bdkj on 2021/10/22.
//

#import "UIDevice+Helper.h"
#import <sys/utsname.h>

@implementation UIDevice (Helper)

+ (NSString*)iphoneType {
    static NSString *deviceString = nil;
    if (deviceString != nil) return deviceString;
    deviceString = [self _iphoneType];
    return deviceString;
}

+ (NSString*)_iphoneType
{
    //需要导入头文件：#import <sys/utsname.h>
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //--------------------iPhone-------------------------
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7"; //国行、日版、港行
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus"; //国行、港行
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7"; //美版、台版
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus"; //美版、台版
    if ([deviceString isEqualToString:@"iPhone10,1"])    return @"iPhone 8"; //国行(A1863)、日行(A1906)
    if ([deviceString isEqualToString:@"iPhone10,2"])    return @"iPhone 8 Plus"; //国行(A1864)、日行(A1898)
    if ([deviceString isEqualToString:@"iPhone10,3"])    return @"iPhone X"; //国行(A1865)、日行(A1902)
    if ([deviceString isEqualToString:@"iPhone10,4"])    return @"iPhone 8"; //美版(Global/A1905)
    if ([deviceString isEqualToString:@"iPhone10,5"])    return @"iPhone 8 Plus"; //美版(Global/A1897)
    if ([deviceString isEqualToString:@"iPhone10,6"])    return @"iPhone X";//美版(Global/A1901)
    if ([deviceString isEqualToString:@"iPhone11,8"])    return @"iPhone XR";
    if ([deviceString isEqualToString:@"iPhone11,2"])    return @"iPhone XS";
    if ([deviceString isEqualToString:@"iPhone11,6"])    return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPhone11,4"])    return @"iPhone XS Max";
    if ([deviceString isEqualToString:@"iPhone12,1"])    return @"iPhone 11";
    if ([deviceString isEqualToString:@"iPhone12,3"])    return @"iPhone 11 Pro";
    if ([deviceString isEqualToString:@"iPhone12,5"])    return @"iPhone 11 Pro Max";
    if ([deviceString isEqualToString:@"iPhone12,8"])    return @"iPhone SE"; //(2nd generation)
    if ([deviceString isEqualToString:@"iPhone13,1"])    return @"iPhone 12 mini";
    if ([deviceString isEqualToString:@"iPhone13,2"])    return @"iPhone 12";
    if ([deviceString isEqualToString:@"iPhone13,3"])    return @"iPhone 12 Pro";
    if ([deviceString isEqualToString:@"iPhone13,4"])    return @"iPhone 12 Pro Max";
    if ([deviceString isEqualToString:@"iPhone14,2"])    return @"iPhone 13 Pro";
    if ([deviceString isEqualToString:@"iPhone14,3"])    return @"iPhone 13 Pro Max";
    if ([deviceString isEqualToString:@"iPhone14,4"])    return @"iPhone 13 mini";
    if ([deviceString isEqualToString:@"iPhone14,5"])    return @"iPhone 13";
    if ([deviceString isEqualToString:@"iPhone14,6"])    return @"iPhone SE"; //(2nd generation)
    if ([deviceString isEqualToString:@"iPhone14,7"])    return @"iPhone 14";
    if ([deviceString isEqualToString:@"iPhone14,8"])    return @"iPhone 14 Plus";
    if ([deviceString isEqualToString:@"iPhone15,2"])    return @"iPhone 14 Pro";
    if ([deviceString isEqualToString:@"iPhone15,3"])    return @"iPhone 14 Pro Max";

    
    //--------------------ipod-----------------------
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    if ([deviceString isEqualToString:@"iPod7,1"])      return @"iPod Touch (6 Gen)";
    if ([deviceString isEqualToString:@"iPod9,1"])      return @"iPod Touch (7 Gen)";

    
    //--------------------iPad-------------------------
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([deviceString isEqualToString:@"iPad6,11"])     return @"iPad 5th";
    if ([deviceString isEqualToString:@"iPad6,12"])     return @"iPad 5th";
    
    if ([deviceString isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9 2nd";
    if ([deviceString isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9 2nd";
    if ([deviceString isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5";
    if ([deviceString isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5";
    
    if ([deviceString isEqualToString:@"iPad7,5"])      return @"iPad 6th";
    if ([deviceString isEqualToString:@"iPad7,6"])      return @"iPad 6th";
    
    if ([deviceString isEqualToString:@"iPad8,1"])      return @"iPad Pro 11";
    if ([deviceString isEqualToString:@"iPad8,2"])      return @"iPad Pro 11";
    if ([deviceString isEqualToString:@"iPad8,3"])      return @"iPad Pro 11";
    if ([deviceString isEqualToString:@"iPad8,4"])      return @"iPad Pro 11";
    
    if ([deviceString isEqualToString:@"iPad8,5"])      return @"iPad Pro 12.9 3rd";
    if ([deviceString isEqualToString:@"iPad8,6"])      return @"iPad Pro 12.9 3rd";
    if ([deviceString isEqualToString:@"iPad8,7"])      return @"iPad Pro 12.9 3rd";
    if ([deviceString isEqualToString:@"iPad8,8"])      return @"iPad Pro 12.9 3rd";
    
    if ([deviceString isEqualToString:@"iPad11,1"])      return @"iPad mini 5th";
    if ([deviceString isEqualToString:@"iPad11,2"])      return @"iPad mini 5th";
    if ([deviceString isEqualToString:@"iPad11,3"])      return @"iPad Air 3rd";
    if ([deviceString isEqualToString:@"iPad11,4"])      return @"iPad Air 3rd";
    
    if ([deviceString isEqualToString:@"iPad11,6"])      return @"iPad 8th";
    if ([deviceString isEqualToString:@"iPad11,7"])      return @"iPad 8th";
    
    if ([deviceString isEqualToString:@"iPad12,1"])      return @"iPad 9th";
    if ([deviceString isEqualToString:@"iPad12,2"])      return @"iPad 9th";
    
    if ([deviceString isEqualToString:@"iPad14,1"])      return @"iPad mini 6th";
    if ([deviceString isEqualToString:@"iPad14,2"])      return @"iPad mini 6th";
    
    //----------------Simuator------------------------
    if([deviceString isEqualToString:@"i386"])
        return @"Simulator";
    if([deviceString isEqualToString:@"x86_64"])
        return @"Simulator";
    
    return deviceString;
}

/**
 震动反馈
 */
+ (void)impactFeedback {
    // 主线程
       dispatch_async(dispatch_get_main_queue(), ^{
           // 版本限制
           if (@available(iOS 10.0, *)) {
               // 初始化震动反馈类
               UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
               // 准备
               [generator prepare];
               // 调用
               [generator impactOccurred];
           }
       });
}

+ (void)callToUserCellphone:(NSString*)argCellphone
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",argCellphone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:^(BOOL success) { }];
}

@end

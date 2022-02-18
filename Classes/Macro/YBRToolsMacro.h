//
//  YBRToolsMacro.h
//  
//
//  Created by bdkj on 2017/11/10.
//

#ifndef YBRToolsMacro_h
#define YBRToolsMacro_h

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define kObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

///是否为空
#define IsNotNilOrNull(obj) (obj && ![obj isEqual:[NSNull null]])
///字符串是否为空
#define IsNotNilOrNullOrEmpty(obj) (IsNotNilOrNull(obj) && ![obj isEqual:@""])

//数组是否为空
#define YBR_ARRAY_IS_EMPTY(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
///是否是数组，并且不为空
#define YBR_ARRAY_IS_NOT_EMPTY(array) (array && [array isKindOfClass:[NSArray class]] && ((NSArray *)array).count > 0)
//字典是否为空
#define YBR_DICT_IS_EMPTY(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys.count == 0)
///是否是字典，并且不为空
#define YBR_DICT_IS_NOT_EMPTY(dic) (dic && [dic isKindOfClass:[NSDictionary class]] && ((NSDictionary *)dic).allKeys.count > 0)
//字符串为空
#define YBR_STR_IS_EMPTY(str) (str == nil || [str isKindOfClass:[NSNull class]] || [str isEqual:@""])
//字符串不为空
#define YBR_STR_IS(str) (str && ![str isKindOfClass:[NSNull class]] && ![str isEqualToString:@""])
///是否是字符串
#define YBR_IS_STR(str) (str && [str isKindOfClass:[NSString class]])
///是否是数组，并且不为空
#define YBR_ARRAY_IS(array) YBR_ARRAY_IS_NOT_EMPTY(array)
///是否是字典，并且不为空
#define YBR_DICT_IS(dic) YBR_DICT_IS_NOT_EMPTY(dic)
///是否是数组
#define YBR_IS_ARRAY(array) (array && [array isKindOfClass:[NSArray class]])
///是否是字典
#define YBR_IS_DICT(dic) (dic && [dic isKindOfClass:[NSDictionary class]])

//获取屏幕宽度与高度
#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

#define kIsNotchScreen \
({\
BOOL result = NO;\
if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone) {\
    if (@available(iOS 11.0, *)) {\
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];\
        if (mainWindow.safeAreaInsets.bottom > 0.0) {\
            result = YES;\
        }\
    }\
}\
result;\
})

#define YBRAnimationDuration 0.3
#define YBRUI_SCALE (kScreenWidth / 414.0f)
#define YBRUI_SCALE_375 (kScreenWidth / 375.0f)

#define YBRTopHeight (kIsNotchScreen ? 88 : 64)
#define YBRStatusBarHeight (kIsNotchScreen ? 44 : 20)
#define YBRStatusFooterBarHeight (kIsNotchScreen ? 34 : 0)

#define YBRFootBarHeight (kIsNotchScreen ? 20 : 0)
#define YBRFootHeight (kIsNotchScreen ? 69 : 49)
#define TABBAR_HEIGHT (kIsNotchScreen ? 100 : 80)
#define YBRAutoFootHeight (kIsNotchScreen ? 75 : 55)

//image
//#define kImageOfName(imageName) [UIImage imageNamed:imageName]
//#define YBR_IMAGE(imageName) kImageOfName(imageName)
//
//#define kMainBundleFilePath(fileName,fileType) [[NSBundle mainBundle] pathForResource:fileName ofType:fileType]
//
//#define kImageOfFile(filePath) [UIImage imageWithContentsOfFile:filePath]
//
//#define kImageOfFileBundle(bundle,imageName,fileType) kImageOfFile([bundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",imageName, fileType]])
//
//
//#define kImageOfFileNameBundle(bundle,imageName) kImageOfFile([bundle.resourcePath stringByAppendingPathComponent:imageName])


//image
#define kImageOfName(imageName) getMainBundleImage(imageName)
#define YBR_IMAGE(imageName) kImageOfName(imageName)

#define kImageOfFile(filePath) getImageOfFile(filePath)

#define kImageOfFileBundle(bundle,imageName,fileType) getImageInBundleOfFileType(bundle,imageName,fileType)

#define kImageOfFileNameBundle(bundle,imageName) getImageInBundleOfFile(bundle,imageName)

#define kMainBundleImage(imageName) getMainBundleImageOfFile(imageName)
#define kMainBundleImageAndType(fileName,fileType) kImageOfFile(kMainBundleFilePath(fileName,fileType))


//一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//APP版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//系统版本号
#define kSystemVersion [[UIDevice currentDevice] systemVersion]
//获取当前语言
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//判断是否为iPhone
#define kISiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define kISiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//获取沙盒Document路径
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒temp路径
#define kTempPath NSTemporaryDirectory()
//获取沙盒Cache路径
#define kCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//真机
#endif

#if TARGET_IPHONE_SIMULATOR
//模拟器
#endif

//自定义打印宏
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...);
#endif

//颜色
#define kRGBColor(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
#define kRandomColor  KRGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1)
#define RGBHex(colorHex) UIColorFromRGB(colorHex)
#define RGBAHex(colorHex,alpha) UIColorFromRGBA(colorHex,alpha)

#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

//弱引用/强引用
#define kWeakSelf(type)   __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)
//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime   NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)

#define CGSizeOne CGSizeMake(1, 1)
#define ccr(_x_,_y_,_w_,_h_)  CGRectMake(_x_,_y_,_w_,_h_)

//单例宏
#undef    AS_SINGLETON
#define AS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;

#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
return __singleton__; \
}

#endif /* YBRToolsMacro_h */

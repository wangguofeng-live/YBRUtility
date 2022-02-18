//
//  UIImage+Helper.m
//  YBRenstore
//
//  Created by bb.huang on 2019/11/12.
//  Copyright © 2019 BDKJ_Hbb. All rights reserved.
//

#import "UIImage+Helper.h"

UIImage* getMainBundleImage(NSString *imageName) {
    return [UIImage imageNamed:imageName];
}

UIImage* getMainBundleImageOfFile(NSString *imageName) {
    return getImageInBundleOfFile([NSBundle mainBundle],imageName);
}

NSString* getMainBundleImagePathOfFile(NSString *fileName) {
    return [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:fileName];
}

UIImage* getImageOfFile(NSString *filePath) {
    return [UIImage imageWithContentsOfFile:filePath];
}

UIImage* getImageInBundleOfFile(NSBundle *bundle, NSString *imageName) {
    return getImageOfFile([bundle.resourcePath stringByAppendingPathComponent:imageName]);
}

UIImage* getImageInBundleOfFileType(NSBundle *bundle, NSString *imageName, NSString *fileType) {
    return getImageOfFile([bundle.resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@",imageName, fileType]]);
}

UIImage* getImageInBundleNameOfFile(NSString *bundleName, NSString *imageName) {
    
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"]];
    
    return getImageOfFile([bundle.resourcePath stringByAppendingPathComponent:imageName]);
}


@implementation UIImage (Helper)

/**
 @brief 点九图
 */
- (UIImage*)ninePointImageWithTopScale:(float)argTop
                             leftScale:(float)argLeft
{
    UIImage *pPointImage = nil;
    CGFloat imageWidth  = self.size.width;
    CGFloat imageHeight = self.size.height;
    
    /// 四个内边距合成中间的方形，方形区域向四方拉伸
    UIEdgeInsets insets = UIEdgeInsetsMake(imageHeight*argTop, imageWidth*argLeft, imageHeight*argTop-1, imageWidth*argLeft-1);
    pPointImage = [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return pPointImage;
}


/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size

{
    NSCAssert(size.width > 0 && size.height > 0, @"Size Can't be zero");
    
    @autoreleasepool {
        //    CGContextRef context = UIGraphicsGetCurrentContext();
        //    UIGraphicsPushContext(context);
        
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        //        UIGraphicsBeginImageContext(rect.size);
        
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context,color.CGColor);
        
        CGContextFillRect(context, rect);
        
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        
        
        //    UIGraphicsPopContext();
        
        return img;
        
    }
}

//改变图片颜色
- (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

/**
 传入需要的占位图尺寸 获取占位图

 @param size 需要的站位图尺寸
 @return 占位图
 */
+ (UIImage *)scaleToSizeWithImage:(UIImage *)img
                    imageViewSize:(CGSize)size {
    
    if (size.width == 0 || size.height == 0) return nil;
    
//+ (UIImage *)placeholderImageWithSize:(CGSize)size {
    // 占位图的背景色
    UIColor *backgroundColor = [UIColor clearColor];
    // 中间LOGO图片
    UIImage *image = img;
    
//    CGSize size = CGSizeMake(argImgViewSize.width * fMScale, argImgViewSize.height * fMScale);

    float fContextScale = size.width / size.height;
    float fImageScale = img.size.width / img.size.height;
    CGSize imageSize = CGSizeMake(1, 1);
    if (fContextScale > fImageScale) {
        //横条
        CGFloat fPHeight = size.height * 0.5f;
        imageSize = CGSizeMake(fPHeight * fImageScale, fPHeight);
    }else {
        //竖条
        CGFloat fPWidth = size.width * 0.5f;
        imageSize = CGSizeMake(fPWidth, fPWidth / fImageScale);
    }
    
    // 根据占位图需要的尺寸 计算 中间LOGO的宽高
//    CGFloat logoWH = (size.width > size.height ? size.height : size.width) * 0.5;
    CGSize logoSize = imageSize;//CGSizeMake(logoWH, logoWH);
    // 打开上下文
    UIGraphicsBeginImageContextWithOptions(size,0, [UIScreen mainScreen].scale);
    // 绘图
    [backgroundColor set];
    UIRectFill(CGRectMake(0,0, size.width, size.height));
    CGFloat imageX = (size.width / 2) - (logoSize.width / 2);
    CGFloat imageY = (size.height / 2) - (logoSize.height / 2);
    [image drawInRect:CGRectMake(imageX, imageY, logoSize.width, logoSize.height)];
    UIImage *resImage =UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();

    return resImage;

}

@end

//
//  UIImage+Helper.m
//  YBRenstore
//
//  Created by bb.huang on 2019/11/12.
//  Copyright © 2019 BDKJ_Hbb. All rights reserved.
//

#import "UIImage+Helper.h"

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

@end

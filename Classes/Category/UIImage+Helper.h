//
//  UIImage+Helper.h
//  YBRenstore
//
//  Created by bb.huang on 2019/11/12.
//  Copyright © 2019 BDKJ_Hbb. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern UIImage* getMainBundleImage(NSString *imageName);
extern UIImage* getMainBundleImageOfFile(NSString *imageName);


extern UIImage* getImageOfFile(NSString *filePath);
extern UIImage* getImageInBundleOfFileType(NSBundle *bundle, NSString *imageName, NSString *fileType);
extern UIImage* getImageInBundleOfFile(NSBundle *bundle, NSString *imageName);
extern UIImage* getImageInBundleNameOfFile(NSString *bundleName, NSString *imageName);

@interface UIImage (Helper)

- (UIImage*)ninePointImageWithTopScale:(float)argTop
                             leftScale:(float)argLeft;


/**
 * 将UIColor变换为UIImage
 *
 **/
+ (UIImage *)imageWithColor:(UIColor *)color;


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

//改变图片颜色
- (UIImage *)imageWithColor:(UIColor *)color;


/**
 传入需要的占位图尺寸 获取占位图

 @param size 需要的站位图尺寸
 @return 占位图
 */
+ (UIImage *)scaleToSizeWithImage:(UIImage *)img
                    imageViewSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

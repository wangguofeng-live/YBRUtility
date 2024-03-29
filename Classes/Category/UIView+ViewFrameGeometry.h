//
//  UIView+ViewFrameGeometry.h
//  YBRUtility
//
//  Created by bdkj on 2022/2/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//获取视图中心点。
CGPoint CGRectGetCenter(CGRect rect);

//视图当前点，移动至中心点。返回cgrect
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)

@property CGPoint origin;

@property CGSize size;

@property (readonly) CGPoint bottomLeft;

@property (readonly) CGPoint bottomRight;

@property (readonly) CGPoint topRight;

@property CGFloat height;

@property CGFloat width;

@property CGFloat top;

@property CGFloat left;

@property CGFloat bottom;

@property CGFloat right;



- (void) moveBy: (CGPoint) delta;

- (void) scaleBy: (CGFloat) scaleFactor;

- (void) fitInSize: (CGSize) aSize;
@end

NS_ASSUME_NONNULL_END

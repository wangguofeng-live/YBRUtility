//
//  YBRUtility
//
//  Created by bdkj on 2023/4/19.
//  Copyright © 2023 Hangzhou Beidu Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Category)

+ (id)dateFormatter;

+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/

@end

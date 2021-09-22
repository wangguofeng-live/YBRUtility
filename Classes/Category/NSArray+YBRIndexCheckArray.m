//
//  NSArray+YBRIndexCheckArray.m
//  YBRInsiderApp
//
//  Created by BDKJ_IOS on 16/3/24.
//  Copyright © 2016年 BDKJ_Hbb. All rights reserved.
//

#import "NSArray+YBRIndexCheckArray.h"

@implementation NSArray (YBRIndexCheckArray)
- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}
@end

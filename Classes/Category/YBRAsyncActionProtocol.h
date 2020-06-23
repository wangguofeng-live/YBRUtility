//
//  YBRAsyncActionProtocol.h
//  YBRInsiderApp
//
//  Created by bdkj on 2017/6/7.
//  Copyright © 2017年 BDKJ_Hbb. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YBRAsyncActionProtocol <NSObject>

// Cancel the Action
- (void)Cancel;

// Status Is Running
- (BOOL)IsRunning;

@end

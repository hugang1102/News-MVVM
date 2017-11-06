//
//  NetworkEngine.h
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkEngine : NSObject

#pragma 监测网络的可链接性
+(void)startNetWorkReachabilityWithNetworkBlock:(NetWorkBlock) netWorkBlock;;

#pragma POST请求
+(void)NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                      WithParameter:(NSDictionary *) parameter
               WithReturnValeuBlock:(ReturnValueBlock) block
                   WithFailureBlock:(FailureBlock) failureBlock;

#pragma GET请求
+(void)NetRequestGETWithRequestURL:(NSString *) requestURLString
                     WithParameter:(NSDictionary *) parameter
              WithReturnValeuBlock:(ReturnValueBlock) block
                  WithFailureBlock:(FailureBlock) failureBlock;

@end

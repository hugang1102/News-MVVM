//
//  NetworkEngine.m
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "NetworkEngine.h"

@implementation NetworkEngine

+(void)startNetWorkReachabilityWithNetworkBlock:(NetWorkBlock)netWorkBlock
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                netWorkBlock(YES);
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                netWorkBlock(YES);
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                netWorkBlock(YES);
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                netWorkBlock(NO);
            }
                break;
        }
    }];
    
    [manager startMonitoring];
}

+(void)NetRequestGETWithRequestURL:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    [manager GET:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
    
}


+(void)NetRequestPOSTWithRequestURL:(NSString *)requestURLString WithParameter:(NSDictionary *)parameter WithReturnValeuBlock:(ReturnValueBlock)block WithFailureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    [manager POST:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock();
    }];
}

@end

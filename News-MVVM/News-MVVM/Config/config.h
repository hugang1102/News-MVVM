//
//  config.h
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#ifndef config_h
#define config_h

#import <Foundation/Foundation.h>

//定义返回请求数据的block类型
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);

//accessToken
#define ACCESSTOKEN @"2.00NofgBD0L1k4pc584f79cc48SKGdD"

//请求公共微博的网络接口
#define REQUESTPUBLICURL @"https://api.weibo.com/2/statuses/public_timeline.json"

#define SOURCE @"source"
#define TOKEN @"access_token"
#define COUNT @"count"

#endif /* config_h */

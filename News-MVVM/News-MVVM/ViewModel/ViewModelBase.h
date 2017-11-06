//
//  ViewModelBase.h
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModelBase : NSObject

@property (strong, nonatomic) ReturnValueBlock returnBlock;
@property (strong, nonatomic) ErrorCodeBlock errorBlock;
@property (strong, nonatomic) FailureBlock failureBlock;

//获取网络的链接状态
- (void)netWorkStateWithNetConnectBlock:(NetWorkBlock) netConnectBlock;

// 传入交互的Block块
- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock;

@end

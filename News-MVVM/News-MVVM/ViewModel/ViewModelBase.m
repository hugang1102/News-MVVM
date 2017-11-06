//
//  ViewModelBase.m
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "ViewModelBase.h"

@implementation ViewModelBase

-(void)netWorkStateWithNetConnectBlock:(NetWorkBlock)netConnectBlock
{
    [NetworkEngine startNetWorkReachabilityWithNetworkBlock:^(BOOL netConnetState) {
        netConnectBlock(netConnetState);
    }];
}

-(void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock WithErrorBlock:(ErrorCodeBlock)errorBlock WithFailureBlock:(FailureBlock)failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}

@end

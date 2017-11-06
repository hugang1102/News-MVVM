//
//  WeiboViewModel.h
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "ViewModelBase.h"

@interface WeiboViewModel : ViewModelBase

/**
 获取围脖列表
 */
- (void)fetchPublicWeiBo;

@end

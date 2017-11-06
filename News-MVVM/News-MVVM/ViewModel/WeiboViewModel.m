//
//  WeiboViewModel.m
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "WeiboViewModel.h"

#import "WeiboListModel.h"

@implementation WeiboViewModel

-(void)fetchPublicWeiBo
{
    NSDictionary *parameter = @{COUNT: @"10",
                                TOKEN: ACCESSTOKEN,
                                };
    [NetworkEngine NetRequestGETWithRequestURL:REQUESTPUBLICURL WithParameter:parameter WithReturnValeuBlock:^(id returnValue) {
        
        NSLog(@"%@", returnValue);
        [self fetchValueSuccessWithDic:returnValue];
        
    } WithFailureBlock:^{
        [self netFailure];
        
    }];
}

/**
 获取到正确的数据，对正确的数据进行处理
 
 @param returnValue 返回成功后的值
 */
-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue {
    //对从后台获取的数据进行处理，然后传给ViewController层进行显示
    
    NSArray *statuses = returnValue[@"statuses"];
    NSMutableArray *publicModelArray = [[NSMutableArray alloc] initWithCapacity:statuses.count];
    
    for (int i = 0; i < statuses.count; i ++) {
        WeiboListModel *model = [[WeiboListModel alloc] init];
        
        //设置时间
        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        //必须设置，否则无法解析
        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSDate *date=[iosDateFormater dateFromString:statuses[i][@"created_at"]];
        
        //目的格式
        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        
        model.date = [resultFormatter stringFromDate:date];
        model.userName = statuses[i][@"user"][@"name"];
        model.text = statuses[i][@"text"];
        model.imageUrl = [NSURL URLWithString:statuses[i][@"user"][@"profile_image_url"]];
        model.userId = statuses[i][@"user"][@"idstr"];
        model.weiboId = statuses[i][@"idstr"];
        [publicModelArray addObject:model];
    }
    if (self.returnBlock) {
        self.returnBlock(publicModelArray);
    }
}

/**
 对ErrorCode进行处理
 
 */
-(void) errorCodeWithDic: (NSDictionary *) errorDic {
    if (self.errorBlock) {
        self.errorBlock(errorDic);
    }
}

/**
 对网路异常进行处理
 */
-(void) netFailure {
    if (self.failureBlock) {
        self.failureBlock();
    }
}

@end

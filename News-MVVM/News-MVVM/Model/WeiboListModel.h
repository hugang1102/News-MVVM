//
//  WeiboListModel.h
//  News-MVVM
//
//  Created by dev on 2017/11/4.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboListModel : NSObject

@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *weiboId;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSURL *imageUrl;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) CGFloat cellHeight;

@end

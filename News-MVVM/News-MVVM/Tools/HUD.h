//
//  HUD.h
//  News-MVVM
//
//  Created by dev on 2017/11/6.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HUD : NSObject

+(void)showHUD;

+(void)showHUDWithMsg:(NSString *)msg;

+(void)hideHUD;

@end

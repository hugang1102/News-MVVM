//
//  HUD.m
//  News-MVVM
//
//  Created by dev on 2017/11/6.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "HUD.h"

@interface HUD ()
@property (nonatomic, strong)MBProgressHUD *hud;
@end

@implementation HUD

+(HUD *)shareInstance
{
    static HUD *hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] init];
    });
    return hud;
}

+(void)showHUD
{
    [self showHUDWithMsg:nil];
}

+(void)showHUDWithMsg:(NSString *)msg
{
    if ([NSThread isMainThread]) {
        if (![HUD shareInstance].hud) {
            [HUD shareInstance].hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
        }
        if (msg.length > 0) {
            [HUD shareInstance].hud.mode = MBProgressHUDModeText;
        } else {
            [HUD shareInstance].hud.mode = MBProgressHUDModeIndeterminate;
        }
        [HUD shareInstance].hud.minShowTime = 3.0f;
        [HUD shareInstance].hud.label.text = msg;
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (![HUD shareInstance].hud) {
                [HUD shareInstance].hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
            }
            if (msg.length > 0) {
                [HUD shareInstance].hud.mode = MBProgressHUDModeText;
            } else {
                [HUD shareInstance].hud.mode = MBProgressHUDModeIndeterminate;
            }
            [HUD shareInstance].hud.minShowTime = 3.0f;
            [HUD shareInstance].hud.label.text = msg;
        });
    }
}

+(void)hideHUD
{
    if ([NSThread isMainThread]) {

        [[HUD shareInstance].hud hideAnimated:YES afterDelay:1.8f];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[HUD shareInstance].hud hideAnimated:YES afterDelay:1.8f];
        });
    }
}

@end

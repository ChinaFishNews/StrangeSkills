//
//  DeviceManger.m
//  StrangeSkills
//
//  Created by 余新闻 on 16/1/21.
//  Copyright © 2016年 新闻. All rights reserved.
//

#import "DeviceManger.h"

#define KAppID  @"1056909503"

@implementation DeviceManger

+(DeviceManger *)shareInstance{
    
    static id shareInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate,^{
        shareInstance = [[self alloc]init];
    });
    return shareInstance;
}

+(void)goToDownloadPageOutApp{
    
    //通过链接生成二维码时需使用https://itunes.apple.com/us/app/id%@?mt=8
    
//    NSString *urlString = [NSString stringWithFormat:
//                           @"itms-apps://itunes.apple.com/us/app/id%@?mt=8",
//                           KAppID];
    
    NSString *urlString = [NSString stringWithFormat:
                           @"https://itunes.apple.com/us/app/id%@?mt=8",
                           KAppID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

+(void)goToDownloadPageInApp{
    
    NSDictionary *parameters = @{ SKStoreProductParameterITunesItemIdentifier:KAppID };
    
    Class isAllow = NSClassFromString(@"SKStoreProductViewController");
    
    if (isAllow != nil) {
        
        SKStoreProductViewController *storeProductViewController = [[SKStoreProductViewController alloc] init];
        
        [storeProductViewController setDelegate:(id)[DeviceManger shareInstance].delegate];
        
        [[DeviceManger shareInstance].delegate openAppStore:storeProductViewController];
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        
        [storeProductViewController loadProductWithParameters:parameters
                                              completionBlock:^(BOOL result, NSError *error){
                                                  
                                                  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                                                  
                                              }];}
}

+(void)goToEvaluatePage{
    
    NSString *urlString = [NSString stringWithFormat:
                     @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",
                     KAppID];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

+(void)goToSearchPageDependskeywords{
    
    NSString *str = [NSString stringWithFormat:
                     @"https://itunes.apple.com/WebObjects/MZStore.woa/wa/search?mt=8&submit=edit&term=%@",
                     [@"比牛" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] ];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

+(void)goToCategoryPage{
    
    /*
     教育: https://itunes.apple.com/cn/genre/ios-jiao-yu/id6017?mt=8
     游戏: https://itunes.apple.com/cn/genre/ios-you-xi/id6014?mt=8
     体育: https://itunes.apple.com/cn/genre/ios-ti-yu/id6004?mt=8
     ...
     */
    NSString *urlString = [NSString stringWithFormat:
                           @"https://itunes.apple.com/cn/genre/ios-jiao-yu/id6017?mt=8"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
}

+(void)goToPaidAppPage{
    
    NSString *urlString = [NSString stringWithFormat:
                           @"https://www.apple.com/cn/itunes/charts/paid-apps/"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

+(void)goToFreeAppPage{
    
    NSString *urlString = [NSString stringWithFormat:
                           @"https://www.apple.com/cn/itunes/charts/free-apps/"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

+(void)goToSystemSettingPage{
    
    //需要定位服务、相机权限等 会跳转至应用设置页面 否则跳转至系统设置页
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    
    [[UIApplication sharedApplication] openURL:url];
}

+(void)goToWifiPage{
    
    //info.plist中添加 URL types 并设置URL Schemes为prefs
    
    //wifi服务
//    NSURL *url = [NSURL URLWithString:@"prefs:root=WIFI"];
    
    //定位服务
//    NSURL *url = [NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
    
    //FaceTime设置
//    NSURL *url = [NSURL URLWithString:@"prefs:root=FACETIME"];
    
    //音乐设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=MUSIC"];
    
    //墙纸设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=Wallpaper"];
    
    //蓝牙设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=Bluetooth"];

    //iCloud设置界面
//    NSURL *url = [NSURL URLWithString:@"prefs:root=CASTLE"];
    
    //Safari设置
//     NSURL *url = [NSURL URLWithString:@"prefs:root=Safari"];
    
    //通知设置
//    NSURL *url = [NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"];
    
    
     NSURL *url = [NSURL URLWithString:@"prefs:root=General&path=Network"];
    
    [[UIApplication sharedApplication] openURL:url];
}

@end

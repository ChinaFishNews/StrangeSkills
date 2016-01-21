//
//  DeviceManger.h
//  StrangeSkills
//
//  Created by 余新闻 on 16/1/21.
//  Copyright © 2016年 新闻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@class ViewController;

@protocol OpenAppStoreDelegate <NSObject>

-(void)openAppStore:(UIViewController *)controller;

@end


@interface DeviceManger : NSObject 

@property(nonatomic,weak) id<OpenAppStoreDelegate> delegate;

+(DeviceManger *)shareInstance;

+(void)goToDownloadPageOutApp;         //AppStore下载页

+(void)goToDownloadPageInApp;          //应用内打开下载页

+(void)goToEvaluatePage;               //评论页

+(void)goToSearchPageDependskeywords;  //关键词搜索页

+(void)goToCategoryPage;               //分类页

+(void)goToPaidAppPage;                //付费应用页

+(void)goToFreeAppPage;                //免费应用页


+(void)goToSystemSettingPage;          //系统设置页

+(void)goToWifiPage;                  //wifi设置页

@end

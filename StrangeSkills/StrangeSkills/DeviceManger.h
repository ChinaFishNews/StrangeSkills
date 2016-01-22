//
//  DeviceManger.h
//  StrangeSkills
//
//  Created by 新闻 on 16/1/21.
//  Copyright © 2016年 新闻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

#import <ifaddrs.h>
#import <arpa/inet.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/ioctl.h>

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

+(void)goToWifiPage;                   //wifi设置页

+(void)hideNavBarHairlineImageView:(UIViewController *)controller;    //隐藏导航栏下得分割线

+(void)isHotSpotConnected;             //判断是否存在热点栏

+(BOOL)isAllowedNotification;          //是否允许推送;

+(void)hideExtraCell:(UITableView *)tableView;                        //tableView隐藏多余的cell

+(void)changeAccessoryViewColor:(UITableView *)tabeView;              //修改cell上accessoryView的颜色

+(void)scrollToTop;                   //点击状态栏滚动到顶部

+(void)checkAppStoreVersion;          //获取appstore上应用版本

+(BOOL)isJailbroken;                  //设备是否越狱

+ (NSString *)totalDiskSpace;         //总的磁盘空间

+ (NSString *)freeDiskSpace ;         //剩余磁盘空间

+ (void)language;                     //获取系统语言

+ (NSString *)currentIPAddress;       //获取当前ip地址

@end

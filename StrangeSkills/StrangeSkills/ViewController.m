//
//  ViewController.m
//  StrangeSkills
//
//  Created by 新闻 on 16/1/21.
//  Copyright © 2016年 新闻. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "DeviceManger.h"

const NSString *const  KAppID = @"1056909503";

@interface ViewController () <OpenAppStoreDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [DeviceManger shareInstance].delegate = self;
    
}

#pragma mark - Event Response

- (IBAction)buttonEvent:(id)sender {
    
//    [DeviceManger goToDownloadOutApp];
 
//    [DeviceManger goToDownloadInApp];
    
//    [DeviceManger goToEvaluate];
    
//    [DeviceManger goToSearchDependskeywords];

//    [DeviceManger goToCategoryPage];
    
//    [DeviceManger goToPaidAppPage];
    
//    [DeviceManger goToFreeAppPage];
    
//    [DeviceManger goToSystemSettingPage];
    
//    [DeviceManger goToWifiPage];

//    [DeviceManger hideNavBarHairlineImageView:self];
    
//    [DeviceManger isHotSpotConnected];
    
//    [DeviceManger isAllowedNotification];
    
//    [DeviceManger hideExtraCell:[UITableView new]];
    
//    [DeviceManger changeAccessoryViewColor:[UITableView new]];
    
//    [DeviceManger scrollToTop];
    
//    [DeviceManger checkAppStoreVersion];
    
//    [DeviceManger isJailbroken];
   
//    [DeviceManger totalDiskSpace];
    
//    [DeviceManger freeDiskSpace];
    
//    [DeviceManger language];
    
    [DeviceManger currentIPAddress];
}

#pragma mark  - OpenAppStoreDelegate
-(void)openAppStore:(UIViewController *)controller{
    
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark SKStoreProductViewControllerDelegate
-(void) productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end

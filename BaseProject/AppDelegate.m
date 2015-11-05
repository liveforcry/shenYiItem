//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"
#import "TuWanViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
   
   
    //可以让出现菜单时不显示转态栏
    self.menu.menuPrefersStatusBarHidden = YES;
    self.window.rootViewController = self.menu;
    [self configGlobalUiStyle];
    return YES;
}

-(UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
          [_window makeKeyAndVisible];
    }
    return _window;
}
//生产放有兔玩游戏界面的导航控制器


- (RESideMenu *)menu {
    if(_menu == nil) {
       _menu = [[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //设置 为侧边栏
        _menu.backgroundImage = [UIImage imageNamed:@"a4814046"];
    }
    return _menu;
}

/**
 *  配置全局UI的样式
 */
-(void)configGlobalUiStyle{
    //导航栏不透明
    
    [[UINavigationBar appearance] setTranslucent:YES];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageName] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
    //配置导航栏题目的样式
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KNaviTitleFontSize],NSForegroundColorAttributeName:KNaviTitleColor}];
}












@end

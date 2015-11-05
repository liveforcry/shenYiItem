//
//  DouWanNetManager.m
//  Item
//
//  Created by apple-jd30 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "DouWanNetManager.h"
#import "FreeHeroModel.h"
#import "AllHeroModel.h"
#import "HeroSkinModel.h"
#import "DuoWanRequestPath.h"
#import "HeroVideoModel.h"
#import "HeroChuZModel.h"
#import "HeroDetailModel.h"
#import "FuWenModel.h"
#import "HeroChangeModel.h"
#import "WeekDataModel.h"
#import "GameBaikeListModel.h"
#import "ZhuangBeiKindModel.h"
#import "ZhuangBeiDesriptionModel.h"
#import "TianFuModel.h"
#import "FuWenListModel.h"
#import "ZhaoHShiSkillsListModel.h"
#import "BestTeam.h"
#import "MouZhuangBeiListModel.h"
#define setOStype  @"OSType" : [@"IOS" stringByAppendingString:[UIDevice currentDevice].systemVersion]
#define setVName  @"versionName" : @"[UIDevice currentDevice].version"

#define setV   @"v" : @"140"
@implementation DouWanNetManager
#pragma mark 全部英雄 和 免费英雄
+(id)getFreeAllHero : (HeroType)type kCompletionHandle{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{setOStype,setV}];
    
    switch (type) {
        case HeroTypeAll:
            [dict setObject:@"all" forKey:@"type"];
            break;
        case HeroTypeFree:
            [dict setObject:@"free" forKey:@"type"];
            break;
        default:
            NSAssert1(NO, @"%s :type类型不正确", __FUNCTION__);
            break;
    }
    return [self GET:HeroPath parameters:dict completionHandler:^(id responseObj, NSError *error) {
        switch (type) {
            case HeroTypeAll:
                completionHandle([AllHeroModel objectWithKeyValues:responseObj],error);
                break;
            case HeroTypeFree:
                completionHandle([FreeHeroModel objectWithKeyValues:responseObj],error);
                break;
            default:
                break;
        }
    }];
}
#pragma mark 英雄的皮肤
+(id)getHeroSkin :(NSString *)heroName kCompletionHandle{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{setV,setOStype,@"hero": heroName,setVName}];
    return [self GET:KHeroSkin parameters:dict completionHandler:^(id responseObj, NSError *error) {
 completionHandle([HeroChuZModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}


#pragma mark 英雄的配音

+(id)getHeroVoice :(NSString *)heroName kCompletionHandle{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{setV,setOStype,@"hero": heroName,setVName}];
    return [self GET:KHeroVoice parameters:dict completionHandler:^(id responseObj, NSError *error) {
        completionHandle(responseObj, error);
    }];
}

#pragma mark  英雄的视频

+(id)getHeroVedio :(NSInteger )pageId :(NSString *)heroName kCompletionHandle{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"action":@"l",@"p":@(pageId),@"src":@"letv",@"tag":heroName,setOStype,setV}];
    return [self GET:KHeroVedio parameters:dict completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChuZModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

#pragma mark 英雄的出装

+(id)getHeroCZ  :(NSString *)heroName kCompletionHandle{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"championName":heroName,@"limit" :@7,setOStype,setV}];
    return [self GET:KHeroCZ parameters:dict completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChuZModel objectArrayWithKeyValuesArray:responseObj],error);
       
    }];
}

#pragma mark 英雄的资料

+(id)getHeroDetail :(NSString *)heroName kCompletionHandle{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"heroName":heroName,setOStype,setV}];
    return [self GET:KHeroDetail parameters:dict completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroDetailModel objectWithKeyValues:responseObj],error);
        
    }];
}

#pragma mark 英雄的符文 

+(id)getHeroTianFu :(NSString *)heroName kCompletionHandle{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"hero":heroName,setOStype,setV}];
    return [self GET:KHeroTianFu parameters:dict completionHandler:^(id responseObj, NSError *error) {
        
        completionHandle([FuWenModel objectArrayWithKeyValuesArray:responseObj],error);
        
    }];
}

#pragma mark 英雄的改动


+ (id)getHeroInfoWithHeroName:(NSString *)enName completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroInfoPath parameters:@{setV, setOStype, @"name": enName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroChangeModel objectWithKeyValues:responseObj], error);
    }];
}


#pragma mark 获取英雄一周数据


+ (id)getWeekDataWithHeroId:(NSInteger)heroId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kHeroWeekDataPath parameters:@{@"heroId": @(heroId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([WeekDataModel objectWithKeyValues:responseObj], error);
    }];
}

#pragma mark  获取游戏百科列表


+ (id)getToolMenuCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kToolMenuPath parameters:@{setV, setVName, setOStype, @"category": @"database"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GameBaikeListModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

#pragma  mark  获取装备分类


+ (id)getZBCategoryCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBCategoryPath parameters:@{} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZhuangBeiKindModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}

#pragma mark  获取某分类装备列表

+ (id)getZBItemListWithTag:(NSString *)tag completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kZBItemListPath parameters:@{@"tag": tag, setV, setOStype, setVName} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MouZhuangBeiListModel objectArrayWithKeyValuesArray:responseObj], error);
    }];
}
#pragma mark *  装备详情

+ (id)getItemDetailWithItemId:(NSInteger)itemId completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kItemDetailPath parameters:@{setV, setOStype, @"id": @(itemId)} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZhuangBeiDesriptionModel objectWithKeyValues:responseObj], error);
    }];
}

#pragma mark  获取天赋树

+ (id)getGIftCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kGiftPath parameters:@{setV, setOStype} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TianFuModel objectWithKeyValues:responseObj], error);
    }];
}
#pragma mark   获取符文列表

+ (id)getRunesCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kRunesPath parameters:@{setV, setOStype} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([FuWenListModel objectWithKeyValues:responseObj], error);
    }];
}

#pragma mark   获取召唤师技能

+ (id)getSumAbilityCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kSumAbilityPath parameters:@{setV, setOStype} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ZhaoHShiSkillsListModel objectWithKeyValues:responseObj], error);
    }];
}
#pragma mark  获取最佳阵容

+ (id)getHeroBestGroupCompletionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:kBestGroupPath parameters:@{setV, setOStype} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BestTeam objectArrayWithKeyValuesArray:responseObj], error);
    }];
}
























@end

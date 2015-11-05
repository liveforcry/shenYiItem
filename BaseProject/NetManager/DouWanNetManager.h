//
//  DouWanNetManager.h
//  Item
//
//  Created by apple-jd30 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"



typedef NS_ENUM(NSUInteger, HeroType) {
    HeroTypeAll,
    HeroTypeFree
};
@interface DouWanNetManager : BaseNetManager
/**
 *  <#Description#>
 *
 *  @param type 免费英雄  全部英雄
 *
 *  @return 
 */
+(id)getFreeAllHero : (HeroType)type kCompletionHandle;
/**
 * 获取英雄的皮肤
 *
 *  @param heroName
 *
 *  @return
 */
+(id)getHeroSkin :(NSString *)heroName kCompletionHandle;
/**
 *  获取英雄的配音
 *
 *  @param heroName
 *
 *  @return 
 */
+(id)getHeroVoice :(NSString *)heroName kCompletionHandle;
/**
 *  获取英雄的视频
 *
 *  @param pageId
 *  @param heroName
 *
 *  @return
 */
+(id)getHeroVedio :(NSInteger )pageId :(NSString *)heroName kCompletionHandle;
/**
 * 英雄的出装
 *
 *  @param heroName
 *
 *  @return
 */
+(id)getHeroCZ  :(NSString *)heroName kCompletionHandle;
/**
 *  英雄的资料
 *
 *  @param heroNmae
 *
 *  @return 
 */
+(id)getHeroDetail :(NSString *)heroName kCompletionHandle;
/**
 *  英雄的符文天赋
 *
 *  @param heroName
 *
 *  @return
 */
+(id)getHeroTianFu :(NSString *)heroName kCompletionHandle;

/**
 *  获取英雄改动
 *
 *  @param enName 英雄英文名
 *
 *  @return 网络请求任务
 */
+ (id)getHeroInfoWithHeroName:(NSString *)enName kCompletionHandle;

/**
 *  获取英雄一周数据
 *
 *  @param heroId 英雄id
 *
 *  @return 网络请求任务
 */
+ (id)getWeekDataWithHeroId:(NSInteger)heroId kCompletionHandle;

/** 获取游戏百科列表 */
+ (id)getToolMenuCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/** 获取装备分类 */
+ (id)getZBCategoryCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/**
 *  获取某分类装备列表
 *
 *  @param tag 分类tag
 *
 *  @return
 */
+ (id)getZBItemListWithTag:(NSString *)tag kCompletionHandle;

/**
 *  装备详情
 *
 *  @param itemId 装备id
 *
 *  @return
 */
+ (id)getItemDetailWithItemId:(NSInteger)itemId kCompletionHandle;

/** 获取天赋树 */
+ (id)getGIftCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/** 获取符文列表 */
+ (id)getRunesCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/** 获取召唤师技能 */
+ (id)getSumAbilityCompletionHandle:(void(^)(id model, NSError *error))completionHandle;

/** 获取最佳阵容 */
+ (id)getHeroBestGroupCompletionHandle:(void(^)(id model, NSError *error))completionHandle;











@end

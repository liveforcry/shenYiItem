//
//  XiMaLaYaNetManager.m
//  Item
//
//  Created by apple-jd30 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaLaYaNetManager.h"
#include "RankingList.h"
#include "MusicKindModel.h"
#define ListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album"

#define  ItemPath @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20"

@implementation XiMaLaYaNetManager
+(id)getXiMaLaYaMusicItem:(NSInteger)Number PageID: (NSInteger)pageNumber kCompletionHandle{
    NSString *path = [NSString stringWithFormat:ItemPath, @(Number), @(pageNumber)];
    return [self GET:path parameters:@{@"device": @"iPhone"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([MusicKindModel objectWithKeyValues:responseObj], error);
    }];;
}
+(id)getMusciList :(NSInteger)ID kCompletionHandle{
    NSDictionary *dict = nil;
    dict = @{@"device":@"iPhone",@"key":@"ranking:album:played:1:2",@"pageId":@(ID),@"pageSize":@(20),@"position":@(0),@"title":@"排行榜"};
    return [self GET:ListPath parameters:dict completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RankingList objectWithKeyValues:responseObj],error);
    }];
}
@end

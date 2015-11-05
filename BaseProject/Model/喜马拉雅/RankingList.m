//
//  RankingList.m
//  BaseProject
//
//  Created by apple-jd30 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankingList.h"

@implementation RankingList



+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [XiMaLaYaList class]};
}
@end






@implementation XiMaLaYaList
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end



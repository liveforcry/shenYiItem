

//
//  TianFuModel.m
//  BaseProject
//
//  Created by apple-jd30 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TianFuModel.h"

@implementation TianFuModel


+ (NSDictionary *)objectClassInArray{
    return @{@"a" : [GiftAModel class], @"d" : [GiftAModel class], @"g" : [GiftAModel class]};
}
@end
@implementation GiftAModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end



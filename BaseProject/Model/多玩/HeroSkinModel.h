//
//  HeroSkinModel.h
//  Item
//
//  Created by apple-jd30 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface HeroSkinModel : BaseModel
//只有遇到字典类型才新建 ，类似于英雄皮肤这个接口， 根是数组， 则不用新建类型
//直接创建数组内部元素
//解析规则：
    //遇到字典即新建类型
// 属性命名 不能是系统关键词 如果改动key 需要在。m文件中重写relpaceKeyFor....
//方法 key 是属性 值是原始值 例如 @{@"desc":@"description", @"ID":@"id"}


@property (nonatomic, copy) NSString *ID; // id

@property (nonatomic, copy) NSString *bigImg;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *smallImg;

@end


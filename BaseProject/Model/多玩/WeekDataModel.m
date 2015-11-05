//
//  WeekDataModel.m
//  BaseProject
//
//  Created by apple-jd30 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WeekDataModel.h"

@implementation WeekDataModel

@end
@implementation WeekDataDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"charts" : [WeekDataChartsModel class]};
}

@end

//@class WeekDataDataModel,WeekDataChartsModel,WeekDataRatioDataModel;
@implementation WeekDataChartsModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ratio_data" : [WeekDataRatioDataModel class]};
}

@end


@implementation WeekDataRatioDataModel

@end



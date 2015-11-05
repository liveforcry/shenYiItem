//
//  TuWanNetManager.h
//  Item
//
//  Created by apple-jd30 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
typedef NS_ENUM(NSUInteger, TuWanListType) {
    TuWanListTypeTuoTiao, //头条1
    TuWanListTypeDuJia, //独家2
    TuWanListTypeAnHei, //暗黑3
    TuWanListTypeMoSou, //魔兽4
    TuWanListTypeFengBao, //风暴5
     TuWanListTypeLuShi, //炉石6
     TuWanListTypeXinJi2, //星际27
     TuWanListTypeShuoWang, //守望8
     TuWanListTypeTuPian, //图片9
     TuWanListTypeShiPing, //视频10
     TuWanListTypeHuanHua, //幻化11
     TuWanListTypeQuWen, //趣闻12
     TuWanListTypeCOS, //COS13
     TuWanListTypeMeiNv, //美女14
     TuWanListTypeGongLue //攻略15
};
@interface TuWanNetManager : BaseNetManager
+(id)getTuWanListFrist :(TuWanListType )type startPage :(NSInteger)start : (void(^)(id response, NSError *error))complete;

@end

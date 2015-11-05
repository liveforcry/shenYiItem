//
//  TuWanNetManager.m
//  Item
//
//  Created by apple-jd30 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanNetManager.h"
#import "TuWanModel.h"
#define KPath @"http://cache.tuwan.com/app/"
#define Kappid              @"appid" : @1

#define Kappver             @"appver" : @2.1

#define KclassMore          @"classmore" :@"indexpic"

//添加的操作

#define KsetDtid(dict,string)      [dict setObject:string forKey:@"dtid"]

#define KremoveClassM(dict)        [dict removeObjectForKey:@"classmore"]

#define KSetmode(dict,string)      [dict setObject:string forKey:@"mod"]

#define KSetClass(dict,string)     [dict setObject:string forKey:@"class"]

#define KsetTypechild(dict,string)  [dict setObject:string forKey:@"typechild"]

#define KsetType(dict,string)      [dict setObject:string forKey:@"type"]

@implementation TuWanNetManager
//把path 和 参数拼接起来 把字符串中的中文转换成百分号 形势 因为有的服务器不接收中文编码

+(id)getTuWanListFrist :(TuWanListType)type startPage :(NSInteger)start : (void(^)(id response, NSError *error))complete{
   
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{Kappid,Kappver,KclassMore,@"start" : @(start)}];
    
    switch (type) {
        case TuWanListTypeAnHei:  //暗黑
            KsetDtid(dict, @"83623");
            
            break;
        case TuWanListTypeDuJia: //独家
            KSetmode(dict, @"八卦");
            KSetClass(dict, @"heronews");
            KremoveClassM(dict);
            break;
            
        case TuWanListTypeFengBao: //风暴
            KsetDtid(dict, @"31538");
            break;
        case TuWanListTypeMoSou: //魔兽
             KsetDtid(dict, @"31537");
            break;
        case TuWanListTypeTuoTiao: //头条
          
            break;
        case TuWanListTypeCOS:   //COS
            KSetClass(dict, @"cos");
            KSetmode(dict, @"cos");
            KsetDtid(dict, @"0");
            break;
        case TuWanListTypeHuanHua: //幻化
            KSetClass(dict, @"cos");
            KSetmode(dict, @"cos");
            KsetDtid(dict, @(0));
             KremoveClassM(dict);
            break;
            
        case TuWanListTypeLuShi: //炉石
            KsetDtid(dict, @"31528");
            break;
        case TuWanListTypeMeiNv: //美女
            KSetClass(dict, @"heronews");
            KSetmode(dict, @"美女");
            KsetTypechild(dict,@"cos1");
            break;
        case TuWanListTypeQuWen: //趣闻
            KSetClass(dict, @"heronews");
            KSetmode(dict, @"趣闻");
            KsetDtid(dict, @(0));
            break;
        case TuWanListTypeShiPing: //视频
            KSetClass(dict, @"83623,31528,31537,31538,57067,91821");
            KSetmode(dict, @"趣闻");
             KremoveClassM(dict);
            KsetType(dict,@"guide");
       
            break;
        case TuWanListTypeShuoWang: //守望
            KsetDtid(dict, @"57067");
             KremoveClassM(dict);
            break;
        case TuWanListTypeTuPian: // 图片
            KsetType(dict,@"pic");
             KremoveClassM(dict);
            KsetDtid(dict, @"83623,31528,31537,31538,57067,91821");
            break;
            
        case TuWanListTypeXinJi2: //星际2
            KsetDtid(dict, @"91821");
             KremoveClassM(dict);
            break;
        case TuWanListTypeGongLue: //攻略
             KremoveClassM(dict);
            KsetDtid(dict, @"83623,31528,31537,31538,57067,91821");
            KsetType(dict,@"guide");
            
            break;

                default:
            break;
    }
   NSString *path = [self percentPathWithPath:KPath params:dict];
   return  [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
       complete([TuWanModel objectWithKeyValues:responseObj], error);
    }];
}



+(NSString *)percentPathWithPath : (NSString *)path params :(NSDictionary *)params{
    // oc 的特性就是runtime 一切都是运行时才决定一切
    //先把path  oc语言特性是runtime 实际我们调用一个方法， 底层操作是， 在一个方法列表中搜索你调用的方法所在的地址，然后 调用完毕后把这个方法各转移到常用方法列表， 所以如果再次调用执行某个方法就在常用方法列表中搜索调用、 效率更高
    
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *key = params.allKeys;
    NSInteger count = key.count;
    for (int i = 0; i < count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@",key[i],params[key[i]]];
        }else{
            [percentPath appendFormat:@"&%@=%@",key[i],params[key[i]]];
        }
    }
    
    //把字符串中的中文转化为%好形式
    return  [percentPath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
@end

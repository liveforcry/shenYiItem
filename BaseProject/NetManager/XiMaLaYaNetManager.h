//
//  XiMaLaYaNetManager.h
//  Item
//
//  Created by apple-jd30 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface XiMaLaYaNetManager : BaseNetManager
+(id)getXiMaLaYaMusicItem:(NSInteger)Number PageID: (NSInteger)pageNumber kCompletionHandle;

+(id)getMusciList :(NSInteger)ID kCompletionHandle;
@end

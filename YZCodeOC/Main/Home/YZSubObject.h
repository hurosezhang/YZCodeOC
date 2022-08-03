//
//  YZSubObject.h
//  YZCodeOC
//
//  Created by zhangyongkang01 on 2021/12/10.
//

#import "YZBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface YZSubObject : YZBaseObject

- (void)noImplFunc;
- (NSString *)noImplStringFunc;
- (instancetype)noImplFuncwithParam:(NSString *)p1 Param2:(NSDictionary *)p1 ;


@end

NS_ASSUME_NONNULL_END

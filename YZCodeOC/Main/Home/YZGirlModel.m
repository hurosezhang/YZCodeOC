//
//  YZGirlModel.m
//  YZCodeOC
//
//  Created by mac on 2022/11/30.
//

#import "YZGirlModel.h"
#import <MJExtension/MJExtension.h>

@implementation YZGirlModel

+ (instancetype)girlModelWithData:(id)data {
    
    YZGirlModel *girlModel = [YZGirlModel mj_objectWithKeyValues:data];
    
    return girlModel;
}

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"data":[YZGirlImageData class]};
}

@end

@implementation YZGirlImageData


@end

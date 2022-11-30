//
//  YZGirlModel.h
//  YZCodeOC
//
//  Created by mac on 2022/11/30.
//

#import <Foundation/Foundation.h>
#import "YZBaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@class YZGirlImageData;
@interface YZGirlModel : YZBaseModel

@property(nonatomic,strong)NSArray<YZGirlImageData *> *data;

+ (instancetype)girlModelWithData:(id)data;

@end

@interface YZGirlImageData : NSObject

@property(nonatomic,copy)NSString *imageFileLength;
@property(nonatomic,copy)NSString *imageSize;
@property(nonatomic,copy)NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END

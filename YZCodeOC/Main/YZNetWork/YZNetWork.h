//
//  YZNetWork.h
//  YZCodeOC
//
//  Created by mac on 2022/11/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/** 请求类型的封装 */
typedef NS_ENUM(NSUInteger,YZHttpRequestType) {
    YZHttpRequestTypeGet = 0, // get
    YZHttpRequestTypePost = 1 // post
};

// 请求成功的回调
typedef void(^YZHttpRequestSuccessBlock)(id responseObject);
// 请求失败的调
typedef void(^YZHttpRequestFaildBlock)(NSError *error);

// 超时时间
extern NSInteger const YZNetworkingTimeOutInterval;

@interface YZNetWork : NSObject

+ (void)requestWithType:(YZHttpRequestType)type
              urlString:(NSString *)urlString
              paramters:(NSDictionary *)paramters
           successBlock:(YZHttpRequestSuccessBlock)successBlock
           failureBlock:(YZHttpRequestFaildBlock)failureBlock;

+ (void)cancelDataTask;

@end

NS_ASSUME_NONNULL_END

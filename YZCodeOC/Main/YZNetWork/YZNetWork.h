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


/// 网络请求的核心方法
/// @param type get or post
/// @param urlString url
/// @param paramters paramters
/// @param successBlock 成功的回调
/// @param failureBlock 失败的回调
+ (void)requestWithType:(YZHttpRequestType)type
              urlString:(NSString *)urlString
              paramters:(NSDictionary *)paramters
           successBlock:(YZHttpRequestSuccessBlock)successBlock
           failureBlock:(YZHttpRequestFaildBlock)failureBlock;

+ (void)requestWithGetTypeurlString:(NSString *)urlString
           successBlock:(YZHttpRequestSuccessBlock)successBlock
           failureBlock:(YZHttpRequestFaildBlock)failureBlock;

+ (void)cancelDataTask;

@end

NS_ASSUME_NONNULL_END

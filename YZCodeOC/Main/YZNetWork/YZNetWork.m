//
//  YZNetWork.m
//  YZCodeOC
//
//  Created by mac on 2022/11/26.
//

#import "YZNetWork.h"
#import <AFNetworking/AFNetworking.h>

NSInteger const YZNetworkingTimeOutInterval = 10;

static AFHTTPSessionManager *manager;

/**
 @"app_secret":@"MEZoeDhIa01ZTmY2dWV2K3RyQ3BEdz09",
 @"app_id":@"rorrgvefkebsoxs0"
 */
#define kApp_secret  @"MEZoeDhIa01ZTmY2dWV2K3RyQ3BEdz09"
#define kApp_id  @"rorrgvefkebsoxs0"

@implementation YZNetWork
 
+ (AFHTTPSessionManager *)sharedAFManager {
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        manager = [AFHTTPSessionManager manager];
        //以下三项manager的属性根据需要进行配置
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/xml",@"text/json",@"text/plain",@"text/JavaScript",@"application/json",@"image/jpeg",@"image/png",@"application/octet-stream",nil];
            
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
            // 设置超时时间
        manager.requestSerializer.timeoutInterval = YZNetworkingTimeOutInterval;
    });
    return manager;
}

+ (void)requestWithType:(YZHttpRequestType)type urlString:(NSString *)urlString paramters:(NSDictionary *)paramters successBlock:(YZHttpRequestSuccessBlock)successBlock failureBlock:(YZHttpRequestFaildBlock)failureBlock {
    if (urlString == nil) {
        return;
    }
    
    // 将app_secret，app_id 加入到参数里
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{
        @"app_secret":kApp_secret,
        @"app_id":kApp_id
    }];
    [dic addEntriesFromDictionary:paramters];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager *manager = [self sharedAFManager];
    NSDictionary *headers = [NSDictionary dictionary];

    if (type == YZHttpRequestTypeGet) {
        [manager GET:urlString parameters:dic headers:headers progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (successBlock) {
                id JSON =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    successBlock(JSON);            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (error.code !=-999) {
                if (failureBlock) {
                    failureBlock(error);
                }
            }else{
                NSLog(@"取消队列了");
            }
        }];
    } else if (type == YZHttpRequestTypePost){
            [manager POST:urlString parameters:paramters headers:headers progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id JSON =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                if (successBlock){
                    successBlock(JSON);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (error.code !=-999) {
                    if (failureBlock){
                        failureBlock(error);
                    }
                }else{
                    NSLog(@"取消队列了");
                }
            }];
        
    } else {
        NSLog(@"既不是post也不是get请求");
    }
}

+ (void)requestWithGetTypeurlString:(NSString *)urlString
           successBlock:(YZHttpRequestSuccessBlock)successBlock
                       failureBlock:(YZHttpRequestFaildBlock)failureBlock {
    [self requestWithType:YZHttpRequestTypeGet urlString:urlString paramters:[NSDictionary dictionary] successBlock:successBlock failureBlock:failureBlock];
}


+ (void)cancelDataTask {
    NSMutableArray *dataTasks = [NSMutableArray arrayWithArray:[self sharedAFManager].dataTasks];
    for (NSURLSessionDataTask *taskObj in dataTasks) {
        [taskObj cancel];
    }
}

@end

//
//  YTRouter.h
//  YTRouterModule
//
//  Created by yuantan on 2021/8/26.
//

#import <Foundation/Foundation.h>

#import "YTRouterMacros.h"

NS_ASSUME_NONNULL_BEGIN


@interface YTRouter : NSObject
+ (nullable id) openUrl:(nonnull NSString *) url params:(nullable NSDictionary *)params error:(NSError*__nullable *__nullable)error callBack:(nullable YTRouterCallBack)callback;
@end

NS_ASSUME_NONNULL_END

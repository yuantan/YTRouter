//
//  YTRouterException.h
//  YTRouterModule
//
//  Created by yuantan on 2021/8/27.
//

#import <Foundation/Foundation.h>
#import "YTRouterMacros.h"

NS_ASSUME_NONNULL_BEGIN

@interface YTRouterException : NSObject
/**
 上报 Router调用异常

 @param type 异常类型
 @param moduleName 组件名
 @param methodName 方法名
 @param exInfo 附件信息，一般为调用的 url 或者 delegate
 */
+ (void)reportExceptionWithType:(YTRouterErrorType)type
                     moduleName:(NSString *)moduleName
                     methodName:(NSString *)methodName
                         exInfo:(NSString *)exInfo;
@end

NS_ASSUME_NONNULL_END

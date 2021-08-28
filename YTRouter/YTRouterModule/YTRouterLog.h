//
//  YTRouterLog.h
//  YTRouterModule
//
//  Created by yuantan on 2021/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface YTRouterLog : NSObject
+ (void)printLog:(NSString *)log;
+ (void)file:(char*)sourceFile function:(char*)funcName lineNum:(int)lineNum format:(NSString*)format, ...;
@end

#define YTJLog(s) [YTRouterLog printLog:(s)]

#define YTLog(s, ...) [YTRouterLog file:__FILE__ function: (char *)__FUNCTION__ lineNum:__LINE__ format:(s),##__VA_ARGS__]

NS_ASSUME_NONNULL_END

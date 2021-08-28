//
//  YTRouterException.m
//  YTRouterModule
//
//  Created by yuantan on 2021/8/27.
//

#import "YTRouterException.h"

@implementation YTRouterException
+ (void)reportExceptionWithType:(YTRouterErrorType)type moduleName:(NSString *)moduleName methodName:(NSString *)methodName exInfo:(NSString *)exInfo{
    
    if (!moduleName) {
        return;
    }
    
    Class cls = NSClassFromString(gExceptionHandlerModuleName);
    if (cls) {
        SEL sel = NSSelectorFromString(gExceptionHandlerSEL);
        if ([cls respondsToSelector:sel]) {
            NSString *reportMsg = nil;
            NSInteger errorCode = 0;
            switch (type) {
                case JDRouterExceptionHandlerTypeModule:
                {
                    reportMsg = [NSString stringWithFormat:@"组件 %@ 未找到",moduleName];
                    errorCode = gModuleErrorCode;
                }
                    break;
                case JDRouterExceptionHandlerTypeMethod:
                {
                    reportMsg = [NSString stringWithFormat:@"组件 %@ 没有实现接口 %@",moduleName, methodName];
                    errorCode = gMethodErrorCode;
                }
                    break;
                    
                default:
                    break;
            }
            
            if (exInfo) {
                reportMsg = [NSString stringWithFormat:@"%@，附加信息：%@",reportMsg,exInfo];
            }
            
            NSError *error = [NSError errorWithDomain:gExceptionDomain code:errorCode userInfo:[NSDictionary dictionaryWithObjectsAndKeys:reportMsg, NSLocalizedDescriptionKey, nil]];
            
            
            NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[cls methodSignatureForSelector:sel]];
            [inv setSelector:sel];
            [inv setTarget:cls];
            [inv setArgument:&error atIndex:2];
            [inv invoke];
        }
    }
}
@end

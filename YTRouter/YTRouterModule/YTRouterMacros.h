//
//  YTRouterMacros.h
//  YTRouter
//
//  Created by yuantan on 2021/8/27.
//

#ifndef YTRouterMacros_h
#define YTRouterMacros_h



#pragma -mark  callback 回调方法

typedef void (^YTRouterCallBack)( id __nullable object);

#pragma -mark  错误类型宏定义

#define ErrorDescripts = @[@"调用路由为空，请检查路由格式",@"调用路由NSString转换NSURL失败，请检查路由格式：%@",@"%@组件不存在，请检查路由格式",@"%@组件调用%@方法失败，请检查路由格式",@"%@组件未实现%@方法，请检查路由格式",@"%@组件调用%@方法参数不匹配，请检查路由格式"]

typedef NS_ENUM(NSInteger,YTRouterErrorType) {
    YTRouterErrorTypeEmptyUrl = 0,
    YTRouterErrorTypeUrlConvertFailure,
    YTRouterErrorTypeModuleNotExsit,
    YTRouterErrorTypeMethodNotExsit,
    YTRouterErrorTypeMethodNotFitModule,
    YTRouterErrorTypeParamsNotFitMethod,
};

#endif /* YTRouterMacros_h */

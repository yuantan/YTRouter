//
//  YTRouterLog.m
//  YTRouterModule
//
//  Created by yuantan on 2021/8/27.
//

#import "YTRouterLog.h"

const NSString * _Nonnull logPrefix = @"YTLog===\n\r";
const NSString * _Nonnull lineFeed = @"\n\r";

@implementation YTRouterLog

+ (void)printLog:(NSString *)log {
#ifdef DEBUG
    NSString *finalLog = [[NSString alloc] initWithFormat:@"%@%@%@",logPrefix,log,lineFeed];
    NSLog(@"%@", finalLog);
#endif
}


+ (void)file:(char*)sourceFile function:(char*)funcName lineNum:(int)lineNum format:(NSString*)format, ...
{
#ifdef DEBUG
    va_list ap;
    NSString *print, *file, *function;
    va_start(ap,format);
    file = [[NSString alloc] initWithBytes: sourceFile length: strlen(sourceFile) encoding: NSUTF8StringEncoding];
    
    function = [NSString stringWithCString:funcName encoding:NSUTF8StringEncoding];
    print = [[NSString alloc] initWithFormat: format arguments: ap];
    va_end(ap);
    NSLog(@"%@ %@:%d %@; %@ %@",logPrefix, [file lastPathComponent], lineNum, function, print, lineFeed);
#endif
}
@end

//
//  FMRLogger.h
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define FRouterLogLevel(lvl,fmt,...)\
[FMRLogger log : YES                                      \
level : lvl                                                  \
format : (fmt), ## __VA_ARGS__]

#define FRouterLog(fmt,...)\
FRouterLogLevel(FRouterLoggerLevelInfo,(fmt), ## __VA_ARGS__)

#define FRouterWarningLog(fmt,...)\
FRouterLogLevel(FRouterLoggerLevelWarning,(fmt), ## __VA_ARGS__)

#define FRouterErrorLog(fmt,...)\
FRouterLogLevel(FRouterLoggerLevelError,(fmt), ## __VA_ARGS__)


typedef NS_ENUM(NSUInteger,FRouterLoggerLevel){
    FRouterLoggerLevelInfo = 1,
    FRouterLoggerLevelWarning ,
    FRouterLoggerLevelError ,
};

@interface FMRLogger : NSObject

@property(class , readonly, strong) FMRLogger *sharedInstance;

+ (BOOL)isLoggerEnabled;

+ (void)enableLog:(BOOL)enableLog;

+ (void)log:(BOOL)asynchronous level:(NSInteger)level format:(NSString *)format, ...;

@end

NS_ASSUME_NONNULL_END

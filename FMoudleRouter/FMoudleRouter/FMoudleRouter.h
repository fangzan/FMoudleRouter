//
//  FMoudleRouter.h
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMRProtocol.h"
#import "FMRRewrite.h"
#import "FMRNavigation.h"
NS_ASSUME_NONNULL_BEGIN

extern NSString *const FRouterParameterURLKey;

typedef void (^FRouterHandler)(NSDictionary *routerParameters);
typedef id _Nullable (^FObjectRouterHandler)(NSDictionary *routerParameters);

typedef void (^FRouterCallback)(id callbackObjc);
typedef void (^FCallbackRouterHandler)(NSDictionary *routerParameters,FRouterCallback targetCallback);

typedef void (^FRouterUnregisterURLHandler)(NSString *routerURL);

@interface FMoudleRouter : NSObject

/**
 Register URL,use it with 'routeURL:' and 'routeURL: withParameters:'.
 
 @param routeURL Registered URL
 @param handlerBlock Callback after route
 */
+ (void)registerRouteURL:(NSString *)routeURL handler:(FRouterHandler)handlerBlock;

/**
 Register URL,use it with 'routeObjectURL:' and ‘routeObjectURL: withParameters:’,can return a Object.
 
 @param routeURL Registered URL
 @param handlerBlock Callback after route, and you can get a Object in this callback.
 */
+ (void)registerObjectRouteURL:(NSString *)routeURL handler:(FObjectRouterHandler)handlerBlock;

/**
 Registered URL, use it with `routeCallbackURL: targetCallback:'and `routeCallback URL: withParameters: targetCallback:', calls back `targetCallback' asynchronously to return an Object
 
 @param routeURL Registered URL
 @param handlerBlock Callback after route,There is a `targetCallback' in `handlerBlock', which corresponds to the `targetCallback:' in `routeCallbackURL: targetCallback:'and `routeCallbackURL: withParameters: targetCallback:', which can be used for asynchronous callback to return an Object.
 */
+ (void)registerCallbackRouteURL:(NSString *)routeURL handler:(FCallbackRouterHandler)handlerBlock;

/**
 通过协议获取对应的Module每次调用都会创建一个新的Module对象
 @param protocol 协议
 @return 对应的组件实例（比如ModuleA，ModuleB...）
 */
+ (id)interfaceForProtocol:(Protocol *)protocol;

/**
 通过协议获取对应的Module并且缓存Module对象，第一次创建Module对象，后面直接从缓存中取
 @param protocol 协议
 @return 对应的组件实例
 */
+ (id)interfaceCacheModuleForProtocol:(Protocol *)protocol;

/**
 Determine whether URL can be Route (whether it has been registered).
 
 @param URL URL to be verified
 @return Can it be routed
 */
+ (BOOL)canRouteURL:(NSString *)URL;

/**
 Route a URL
 
 @param URL URL to be routed
 */
+ (void)routeURL:(NSString *)URL;

/**
 Route a URL and bring additional parameters.
 
 @param URL URL to be routed
 @param parameters Additional parameters
 */
+ (void)routeURL:(NSString *)URL withParameters:(NSDictionary<NSString *, id> *)parameters;

/**
 Route a URL and get the returned Object
 
 @param URL URL to be routed
 @return Returned Object
 */
+ (id)routeObjectURL:(NSString *)URL;

/**
 Route a URL and bring additional parameters. get the returned Object
 
 @param URL URL to be routed
 @param parameters Additional parameters
 @return Returned Object
 */
+ (id)routeObjectURL:(NSString *)URL withParameters:(NSDictionary<NSString *, id> *)parameters;

/**
 Route a URL, 'targetCallBack' can asynchronously callback to return a Object.
 
 @param URL URL to be routed
 @param targetCallback asynchronous callback
 */
+ (void)routeCallbackURL:(NSString *)URL targetCallback:(FRouterCallback)targetCallback;

/**
 Route a URL with additional parameters, and 'targetCallBack' can asynchronously callback to return a Object.
 
 @param URL URL to be routed
 @param parameters Additional parameters
 @param targetCallback asynchronous callback
 */
+ (void)routeCallbackURL:(NSString *)URL withParameters:(NSDictionary<NSString *, id> *)parameters targetCallback:(FRouterCallback)targetCallback;

/**
 Route callback for an unregistered URL
 
 @param handler Callback
 */
+ (void)routeUnregisterURLHandler:(FRouterUnregisterURLHandler)handler;

/**
 Cancel registration of a URL
 
 @param URL URL to be cancelled
 */
+ (void)unregisterRouteURL:(NSString *)URL;

/**
 Unregister all URL
 */
+ (void)unregisterAllRoutes;

/**
 Whether to display Log for debugging
 
 @param enable YES or NO.The default is NO
 */
+ (void)setLogEnabled:(BOOL)enable;

@end

NS_ASSUME_NONNULL_END

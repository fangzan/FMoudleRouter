//
//  FMRConfig.m
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "FMRConfig.h"

@implementation FMRConfig

+ (id <FDemoVCPro>)demoVCPro
{
    // FOneVCProtocol组件
    return [FMoudleRouter interfaceCacheModuleForProtocol:@protocol(FDemoVCPro)];
}

+ (id <FDetailVCPro>)detailVCPro
{
    // FOneVCProtocol组件
    return [FMoudleRouter interfaceCacheModuleForProtocol:@protocol(FDetailVCPro)];
}

+ (void)initialRouteURL
{
    // 开启打印
    [FMoudleRouter setLogEnabled:YES];
    
    // demoVCUrl注册
    [FMoudleRouter registerRouteURL:[self demoVCPro].schemesUrl handler:^(NSDictionary *routerParameters) {
        [[self demoVCPro] setParameters:routerParameters];
        [FMRNavigation pushViewController:[self demoVCPro].interfaceViewController animated:YES];
    }];
    
    // detailVCUrl注册
    [FMoudleRouter registerRouteURL:[self detailVCPro].schemesUrl handler:^(NSDictionary *routerParameters) {
        [[self detailVCPro] setParameters:routerParameters];
        [FMRNavigation pushViewController:[self detailVCPro].interfaceViewController animated:YES];
    }];
    
    //detailVCObjUrl注册
    [FMoudleRouter registerObjectRouteURL:[self detailVCPro].objSchemesUrl handler:^id(NSDictionary *routerParameters) {
        NSString *str = [NSString stringWithFormat:@"%@",[[self detailVCPro] testDetailObjectResult]];
        return str;
    }];
    
    //注册 wildcard://*
    [FMoudleRouter registerRouteURL:[self detailVCPro].wildSchemesUrl handler:^(NSDictionary *routerParameters) {
        [[self detailVCPro] setParameters:routerParameters];
        [FMRNavigation pushViewController:[self detailVCPro].interfaceViewController animated:YES];        
    }];
    
    //注册 protocol://page/RouterCallbackDetails
    [FMoudleRouter registerCallbackRouteURL:[self detailVCPro].callBackSchemesUrl handler:^(NSDictionary *routerParameters, FRouterCallback targetCallback) {
        [[self detailVCPro] setParameters:routerParameters];
        [self detailVCPro].callbackBlock = ^(id  _Nullable parameter) { targetCallback(parameter); };
        [FMRNavigation pushViewController:[self detailVCPro].interfaceViewController animated:YES];
    }];
    
    // 添加规则
    [self addRewriteMatchRules];
}

+ (void)addRewriteMatchRules {
    [FMRRewrite addRewriteMatchRule:@"(?:https://)?www.baidu.com/wd/(\\d+)" targetRule:[NSString stringWithFormat:@"%@?id=$1",[FMRConfig detailVCPro].schemesUrl]];
    [FMRRewrite addRewriteMatchRule:@"(?:https://)?www.taobao.com/search/(.*)" targetRule:[NSString stringWithFormat:@"%@?id=$$1",[FMRConfig detailVCPro].schemesUrl]];
    [FMRRewrite addRewriteMatchRule:@"(?:https://)?www.jd.com/search/(.*)" targetRule:[NSString stringWithFormat:@"%@?id=$#1",[FMRConfig detailVCPro].schemesUrl]];
}


@end

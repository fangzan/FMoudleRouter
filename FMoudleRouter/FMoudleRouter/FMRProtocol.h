//
//  FMRProtocol.h
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "FMoudleRouter.h"

// 回调返回类型 建议(返回数据类型,返回内容) -> {"code":@"1001","data":{}}
typedef void(^FCallBackBlock)(id _Nullable parameter);

NS_ASSUME_NONNULL_BEGIN
#pragma mark -基础组件 这里可以定义一些公共的api和属性

@protocol FMRProtocol <NSObject>
@optional;
//回调
@property (nonatomic, copy) FCallBackBlock callbackBlock;
// schemesUrl
@property (nonatomic, copy) NSString *schemesUrl;
// objSchemesUrl
@property (nonatomic, copy) NSString *objSchemesUrl;
// wildSchemesUrl
@property (nonatomic, copy) NSString *wildSchemesUrl;
// callBackSchemesUrl
@property (nonatomic, copy) NSString *callBackSchemesUrl;

@end

NS_ASSUME_NONNULL_END

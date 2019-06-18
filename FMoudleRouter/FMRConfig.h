//
//  FMRConfig.h
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDemoVCPro.h"
#import "FDetailVCPro.h"
NS_ASSUME_NONNULL_BEGIN

@interface FMRConfig : NSObject

+ (void)initialRouteURL;

+ (id <FDemoVCPro>)demoVCPro;

+ (id <FDetailVCPro>)detailVCPro;

@end

NS_ASSUME_NONNULL_END

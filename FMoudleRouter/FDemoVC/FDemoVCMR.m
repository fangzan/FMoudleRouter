//
//  FDemoVCMR.m
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "FDemoVCMR.h"
#import "FDemoViewController.h"


@implementation FDemoVCMR

@synthesize schemesUrl;

- (NSString *)schemesUrl{
    return  @"fmrdemo://page/FDemoViewController";
}

- (id)interfaceViewController
{
    return [[FDemoViewController alloc]init];
}

- (void)setParameters:(NSDictionary *)parameters
{
    NSLog(@"123123123123123123%@",parameters);
}

@end

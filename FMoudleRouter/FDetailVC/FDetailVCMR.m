//
//  FDetailVCMR.m
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "FDetailVCMR.h"
#import "FDetailViewController.h"

@interface FDetailVCMR ()

@end

@implementation FDetailVCMR

@synthesize schemesUrl;
@synthesize objSchemesUrl;
@synthesize callBackSchemesUrl;
@synthesize callbackBlock;

@synthesize nickname;
@synthesize nation;
@synthesize image;

- (NSString *)schemesUrl{
    return  @"fmrdemo://page/FDetailViewController";
}

- (NSString *)objSchemesUrl{
    return @"fmrdemo://page/FDetailViewControllerObj";
}

- (NSString *)wildSchemesUrl{
    return @"wildcard://*";
}

- (NSString *)callBackSchemesUrl{
    return @"fmrdemo://page/FDetailViewControllerCallBack";
}

- (id)interfaceViewController
{
    return [[FDetailViewController alloc]init];
}

- (void)setParameters:(NSDictionary *)parameters
{
    NSLog(@"123123123123123123%@",parameters);
    
    self.nickname = parameters[@"nickname"];
    self.nation = parameters[@"nation"];
    self.image = parameters[@"img"];
}

- (void)showAlterViewCallBackInViewController:(UIViewController*)viewController
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"" message:@"测试回调函数" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.callbackBlock) {
            self.callbackBlock(@"1234");
        }
    }];
    [alter addAction:sureAction];
    
    [viewController presentViewController:alter animated:YES completion:nil];
}

- (NSString *)testDetailObjectResult
{
    return @"这是来自RouterDetailController的字符串";
}

@end

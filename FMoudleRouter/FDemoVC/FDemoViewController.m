//
//  FDemoViewController.m
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "FDemoViewController.h"
#import "FMRConfig.h"

@interface FDemoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation FDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FRouterDemo";
}
- (IBAction)btn01Click:(UIButton *)sender {
    //  routeURL
    [FMoudleRouter routeURL:[NSString stringWithFormat:@"%@?nickname=imlifengfeng&nation=中国",[FMRConfig detailVCPro].schemesUrl]];
}
- (IBAction)btn02Click:(UIButton *)sender {
    // routeURL并传递对象参数
    [FMoudleRouter routeURL:[NSString stringWithFormat:@"%@?nickname=imlifengfeng&nation=中国",[FMRConfig detailVCPro].schemesUrl] withParameters:@{@"img":[UIImage imageNamed:@"router_test_img"]}];
}
- (IBAction)btn03Click:(UIButton *)sender {
    // 通过routeObjectURL获取返回值
    self.testLabel.text = [FMoudleRouter routeObjectURL:[FMRConfig detailVCPro].objSchemesUrl];
}
- (IBAction)btn04Click:(UIButton *)sender {
    // 通过routeCallbackURL异步回调获取返回值
    [FMoudleRouter routeCallbackURL:[NSString stringWithFormat:@"%@?nickname=imlifengfeng&nation=中国",[FMRConfig detailVCPro].callBackSchemesUrl] targetCallback:^(id callbackObjc) {
        self.testLabel.text = [NSString stringWithFormat:@"%@",callbackObjc];
    }];
}
- (IBAction)btn05Click:(UIButton *)sender {
    // 通配符(*)方式注册URL
    [FMoudleRouter routeURL:@"wildcard://path/path2/path3?nickname=imlifengfeng&nation=中国"];
}
- (IBAction)btn06Click:(UIButton *)sender {
    // route一个未注册的URL
    [FMoudleRouter routeURL:@"protocol://hahahhahahhahhaha"];
}
- (IBAction)btn07Click:(UIButton *)sender {
    // Rewrite一个URL
    [FMoudleRouter routeURL:@"https://www.baidu.com/wd/66666"];
}
- (IBAction)btn08Click:(UIButton *)sender {
    // Rewrite一个URL并对某值URL Encode
    [FMoudleRouter routeURL:@"https://www.taobao.com/search/原子弹"];
}
- (IBAction)btn09Click:(UIButton *)sender {
    // Rewrite一个URL并对某值URL Decode
    [FMoudleRouter routeURL:@"https://www.jd.com/search/%E5%8E%9F%E5%AD%90%E5%BC%B9"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

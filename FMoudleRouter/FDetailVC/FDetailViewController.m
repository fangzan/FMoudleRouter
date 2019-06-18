//
//  FDetailViewController.m
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "FDetailViewController.h"
#import "FMRConfig.h"
@interface FDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImgView;


@property (nonatomic,strong) NSString *logText;
@property (nonatomic,strong) UIImage *logImg;

@end

@implementation FDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"FDetailViewController";
    
    [self showDetailData];
}

- (void)showDetailData
{
    self.contentLabel.text = [NSString stringWithFormat:@"nickName:%@,nation:%@",FMRConfig.detailVCPro.nickname,FMRConfig.detailVCPro.nation];
    self.contentImgView.image = FMRConfig.detailVCPro.image;
}


- (IBAction)showAlert:(UIButton *)sender {
    
    [FMRConfig.detailVCPro showAlterViewCallBackInViewController:self];
    
    FMRConfig.detailVCPro.callbackBlock = ^(id  _Nullable parameter) {
        NSLog(@"%@",parameter);
    };
}

- (IBAction)callBackBtnClick:(UIButton *)sender {
    if (FMRConfig.detailVCPro.callbackBlock) {
        NSString *callbackStr = [NSString stringWithFormat:@"我是回调过来的字符串 %@",[self getCurrentTime]];
        FMRConfig.detailVCPro.callbackBlock(callbackStr);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)getCurrentTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *dateNow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:dateNow];
    return currentTimeString;
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

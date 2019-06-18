//
//  FDetailVCPro.h
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "FMRProtocol.h"

@protocol FDetailVCPro <FMRProtocol>

- (id)interfaceViewController;

- (void)setParameters:(NSDictionary *)parameters;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, copy) NSString *nation;

@property (nonatomic, strong) UIImage *image;

- (NSString *)testDetailObjectResult;

- (void)showAlterViewCallBackInViewController:(UIViewController*)viewController;

@end

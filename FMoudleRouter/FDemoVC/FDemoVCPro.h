//
//  FDemoVCPro.h
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import "FMRProtocol.h"

@protocol FDemoVCPro <FMRProtocol>

- (id)interfaceViewController;

- (void)setParameters:(NSDictionary *)parameters;

@end


//
//  FMRRewrite.h
//  FMoudleRouter
//
//  Created by AoChen on 2019/6/17.
//  Copyright © 2019 Ac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMRRewrite : NSObject

/**
 According to the set of Rules, go to rewrite URL.
 
 @param url URL to be rewritten
 @return URL after being rewritten
 */
+ (NSString *)rewriteURL:(NSString *)url;

/**
 Add a RewriteRule
 
 @param matchRule Regular matching rule
 @param targetRule Conversion rules
 */
+ (void)addRewriteMatchRule:(NSString *)matchRule targetRule:(NSString *)targetRule;

/**
 Add multiple RewriteRule at the same time, the format must be：@[@{@"matchRule":@"YourMatchRule",@"targetRule":@"YourTargetRule"},...]
 
 @param rules RewriteRules
 */
+ (void)addRewriteRules:(NSArray<NSDictionary *> *)rules;

/**
 Remove a RewriteRule
 
 @param matchRule MatchRule to be removed
 */
+ (void)removeRewriteMatchRule:(NSString *)matchRule;

/**
 Remove all RewriteRule
 */
+ (void)removeAllRewriteRules;

@end

NS_ASSUME_NONNULL_END

// Copyright © 2018-2022 Bandyer S.r.l. All Rights Reserved.
// See LICENSE for licensing information

#import "BTKiOS11AndBelowTestCase.h"

@implementation BTKiOS11AndBelowTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 12.0, *))
        return nil;
    return [super testCaseWithInvocation:invocation];;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 12.0, *))
        return nil;
    return [super testCaseWithSelector:selector];
}

@end

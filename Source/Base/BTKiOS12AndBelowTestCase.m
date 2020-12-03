// Copyright © 2019 Bandyer S.r.l. All Rights Reserved
// See LICENSE.txt for licensing information

#import "BTKiOS12AndBelowTestCase.h"

@implementation BTKiOS12AndBelowTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 13.0, *))
        return nil;
    return [super testCaseWithInvocation:invocation];;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 13.0, *))
        return nil;
    return [super testCaseWithSelector:selector];
}

@end

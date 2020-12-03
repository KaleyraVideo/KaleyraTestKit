// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import "BTKiOS9AndBelowTestCase.h"

@implementation BTKiOS9AndBelowTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 10.0, *))
        return nil;
    return [super testCaseWithInvocation:invocation];;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 10.0, *))
        return nil;
    return [super testCaseWithSelector:selector];
}

@end

// Copyright © 2021 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import "BTKiOS12AndAboveTestCase.h"

@implementation BTKiOS12AndAboveTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 12.0, *))
        return [super testCaseWithInvocation:invocation];
    return nil;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 12.0, *))
        return [super testCaseWithSelector:selector];
    return nil;
}

@end

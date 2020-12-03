// Copyright © 2018 Bandyer S.r.l. All Rights Reserved
// See LICENSE.txt for licensing information

#import "BTKiOS11AndAboveTestCase.h"

@implementation BTKiOS11AndAboveTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 11.0, *))
        return [super testCaseWithInvocation:invocation];
    return nil;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 11.0, *))
        return [super testCaseWithSelector:selector];
    return nil;
}

@end

// Copyright © 2018-2023 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

#import "BTKiOS15AndAboveTestCase.h"

@implementation BTKiOS15AndAboveTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 15.0, *))
        return [super testCaseWithInvocation:invocation];
    return nil;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 15.0, *))
        return [super testCaseWithSelector:selector];
    return nil;
}

@end

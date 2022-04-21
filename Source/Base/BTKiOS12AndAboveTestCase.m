// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
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

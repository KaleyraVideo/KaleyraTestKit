// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

#import "BTKiOS10AndBelowTestCase.h"


@implementation BTKiOS10AndBelowTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 11.0, *))
        return nil;
    return [super testCaseWithInvocation:invocation];;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 11.0, *))
        return nil;
    return [super testCaseWithSelector:selector];
}


@end

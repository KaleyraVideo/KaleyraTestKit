// Copyright © 2019 Bandyer S.r.l. All Rights Reserved
// See LICENSE.txt for licensing information

#import "BTKiOS13AndAboveTestCase.h"

@implementation BTKiOS13AndAboveTestCase

+ (instancetype)testCaseWithInvocation:(nullable NSInvocation *)invocation
{
    if (@available(iOS 13.0, *))
        return [super testCaseWithInvocation:invocation];
    return nil;
}

+ (instancetype)testCaseWithSelector:(SEL)selector
{
    if (@available(iOS 13.0, *))
        return [super testCaseWithSelector:selector];
    return nil;
}

@end

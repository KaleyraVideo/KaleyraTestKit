// Copyright © 2018 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#import "BTKGeometryAssert.h"
#import <OCHamcrest/HCAssertThat.h>

void BTK_assertThatCGSizeWithLocation(id testCase, CGSize actual, id <HCMatcher> matcher, char const *fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGSize:actual], matcher, fileName, lineNumber);
}

void BTK_assertThatCGPointWithLocation(id testCase, CGPoint actual, id <HCMatcher> matcher, char const *fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGPoint:actual], matcher, fileName, lineNumber);
}

void BTK_assertThatCGRectWithLocation(id testCase, CGRect actual,
        id <HCMatcher> matcher, char const *fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithCGRect:actual], matcher, fileName, lineNumber);
}

void BTK_assertThatUIEdgeInsetsWithLocation(id testCase, UIEdgeInsets actual, id <HCMatcher> matcher, char const *fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSValue valueWithUIEdgeInsets:actual], matcher, fileName, lineNumber);
}

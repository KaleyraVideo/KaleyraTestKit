// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import "BTKThreadAssert.h"

#import <OCHamcrest/HCAssertThat.h>

void BTK_assertOnMainThreadWithLocation(id testCase, id<HCMatcher> matcher, char const *fileName, int lineNumber)
{
    HC_assertThatWithLocation(testCase, [NSNumber numberWithBool:[NSThread isMainThread]], matcher, fileName, lineNumber);
}

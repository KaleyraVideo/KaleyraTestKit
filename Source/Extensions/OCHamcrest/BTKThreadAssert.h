// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HCMatcher;

FOUNDATION_EXPORT void BTK_assertOnMainThreadWithLocation(id testCase, id<HCMatcher> matcher, char const *fileName, int lineNumber);

#define BTK_assertOnMainThread() \
    BTK_assertOnMainThreadWithLocation(self, isTrue(), __FILE__, __LINE__)

#ifndef BTK_DISABLE_SHORT_SYNTAX
    #define assertOnMainThread() BTK_assertOnMainThread()
#endif

#define BTK_assertNOTOnMainThread() \
    BTK_assertOnMainThreadWithLocation(self, isFalse(), __FILE__, __LINE__)

#ifndef BTK_DISABLE_SHORT_SYNTAX
    #define assertNOTOnMainThread() BTK_assertNOTOnMainThread()
#endif

NS_ASSUME_NONNULL_END

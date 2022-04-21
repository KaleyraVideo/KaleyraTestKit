// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

#import <UIKit/UIKit.h>

@protocol HCMatcher;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT void BTK_assertThatCGSizeWithLocation(id testCase, CGSize actual, id <HCMatcher> matcher, char const *fileName, int lineNumber);

#define BTK_assertThatCGSize(actual, matcher)  \
    BTK_assertThatCGSizeWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifndef BTK_DISABLE_SHORT_SYNTAX

#define assertThatCGSize(actual, matcher) BTK_assertThatCGSize(actual, matcher)

#endif

FOUNDATION_EXPORT void BTK_assertThatCGPointWithLocation(id testCase, CGPoint actual, id <HCMatcher> matcher, char const *fileName, int lineNumber);

#define BTK_assertThatCGPoint(actual, matcher)  \
    BTK_assertThatCGPointWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifndef BTK_DISABLE_SHORT_SYNTAX

#define assertThatCGPoint(actual, matcher) BTK_assertThatCGPoint(actual, matcher)

#endif

FOUNDATION_EXPORT void BTK_assertThatCGRectWithLocation(id testCase, CGRect actual, id <HCMatcher> matcher, char const *fileName, int lineNumber);

#define BTK_assertThatCGRect(actual, matcher) \
    BTK_assertThatCGRectWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifndef BTK_DISABLE_SHORT_SYNTAX

#define assertThatCGRect(actual, matcher) BTK_assertThatCGRect(actual, matcher)

#endif

FOUNDATION_EXPORT void BTK_assertThatUIEdgeInsetsWithLocation(id testCase, UIEdgeInsets actual, id <HCMatcher> matcher, char const *fileName, int lineNumber);

#define BTK_assertThatUIEdgeInsets(actual, matcher) \
    BTK_assertThatUIEdgeInsetsWithLocation(self, actual, matcher, __FILE__, __LINE__)

#ifndef BTK_DISABLE_SHORT_SYNTAX

 #define assertThatUIEdgeInsets(actual, matcher) BTK_assertThatUIEdgeInsets(actual, matcher)

#endif

NS_ASSUME_NONNULL_END

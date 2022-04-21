// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT id BTK_throwsInvalidArgumentException(void);

#ifndef BTK_DISABLE_SHORT_SYNTAX

static inline id throwsInvalidArgumentException(void)
{
    return BTK_throwsInvalidArgumentException();
}
#endif

FOUNDATION_EXPORT id BTK_throwsInternalInconsistencyException(void);

#ifndef BTK_DISABLE_SHORT_SYNTAX

static inline id throwsInternalInconsistencyException(void)
{
    return BTK_throwsInternalInconsistencyException();
}
#endif

NS_ASSUME_NONNULL_END

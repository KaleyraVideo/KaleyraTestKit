// Copyright © 2018 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT id BTK_equalToCGSize(CGSize value);

#ifndef BTK_DISABLE_SHORT_SYNTAX

static inline id equalToCGSize(CGSize value)
{
    return BTK_equalToCGSize(value);
}
#endif

FOUNDATION_EXPORT id BTK_equalToCGPoint(CGPoint value);

#ifndef BTK_DISABLE_SHORT_SYNTAX

static inline id equalToCGPoint(CGPoint value)
{
    return BTK_equalToCGPoint(value);
}
#endif

FOUNDATION_EXPORT id BTK_equalToCGRect(CGRect value);

#ifndef BTK_DISABLE_SHORT_SYNTAX

static inline id equalToCGRect(CGRect value)
{
    return BTK_equalToCGRect(value);
}

#endif

FOUNDATION_EXPORT id BTK_equalToUIEdgeInsets(UIEdgeInsets value);

#ifndef BTK_DISABLE_SHORT_SYNTAX

static inline id equalToUIEdgeInsets(UIEdgeInsets value)
{
    return BTK_equalToUIEdgeInsets(value);
}

#endif

NS_ASSUME_NONNULL_END

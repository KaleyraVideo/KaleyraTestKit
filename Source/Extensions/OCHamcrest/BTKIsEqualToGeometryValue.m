// Copyright © 2018 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#import "BTKIsEqualToGeometryValue.h"

#import <OCHamcrest/HCIsEqual.h>

FOUNDATION_EXPORT id BTK_equalToCGSize(CGSize value)
{
    return HC_equalTo([NSValue valueWithCGSize:value]);
}

FOUNDATION_EXPORT id BTK_equalToCGPoint(CGPoint value)
{
    return HC_equalTo([NSValue valueWithCGPoint:value]);
}

FOUNDATION_EXPORT id BTK_equalToCGRect(CGRect value)
{
    return HC_equalTo([NSValue valueWithCGRect:value]);
}

FOUNDATION_EXPORT id BTK_equalToUIEdgeInsets(UIEdgeInsets value)
{
    return HC_equalTo([NSValue valueWithUIEdgeInsets:value]);
}

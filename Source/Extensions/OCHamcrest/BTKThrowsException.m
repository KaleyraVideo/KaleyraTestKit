// Copyright © 2018 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#import "BTKThrowsException.h"

#import <OCHamcrest/OCHamcrest.h>

id BTK_throwsInvalidArgumentException(void)
{
    return HC_throwsException(HC_hasProperty(@"name", HC_equalTo(NSInvalidArgumentException)));
}

id BTK_throwsInternalInconsistencyException(void)
{
    return HC_throwsException(HC_hasProperty(@"name", HC_equalTo(NSInternalInconsistencyException)));
}

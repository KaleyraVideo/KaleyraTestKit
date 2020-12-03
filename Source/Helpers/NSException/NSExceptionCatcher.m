// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <Foundation/Foundation.h>

#import "NSExceptionCatcher.h"

void tryAndCatch(void(^tryBlock)(void), void(^catchBlock)(NSException * exc))
{
    @try {
        tryBlock();
    } @catch(NSException *exc) {
        catchBlock(exc);
    }
}

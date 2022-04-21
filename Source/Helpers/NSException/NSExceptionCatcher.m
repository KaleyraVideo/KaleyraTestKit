// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
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

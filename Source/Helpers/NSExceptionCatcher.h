// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <Foundation/Foundation.h>

void tryAndCatch(void(NS_NOESCAPE ^tryBlock)(void), void(NS_NOESCAPE ^catchBlock)(NSException * exc));

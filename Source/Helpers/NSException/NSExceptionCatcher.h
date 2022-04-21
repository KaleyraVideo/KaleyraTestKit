// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

#import <Foundation/Foundation.h>

void tryAndCatch(void(NS_NOESCAPE ^tryBlock)(void), void(NS_NOESCAPE ^catchBlock)(NSException * exc));

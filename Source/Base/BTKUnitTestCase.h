// Copyright © 2019 Bandyer S.r.l. All Rights Reserved
// See LICENSE.txt for licensing information

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

@interface BTKUnitTestCase : XCTestCase
@end

@interface BTKUnitTestCase (DummyErrors)

- (NSError *)dummyError;

@end

NS_ASSUME_NONNULL_END

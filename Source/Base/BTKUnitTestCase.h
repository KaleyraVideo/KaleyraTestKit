// Copyright © 2019 Bandyer S.r.l. All Rights Reserved
// See LICENSE.txt for licensing information

#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(UnitTestCase)
@interface BTKUnitTestCase : XCTestCase
@end

@interface BTKUnitTestCase (DummyErrors)

- (NSError *)dummyError;

@end

NS_ASSUME_NONNULL_END

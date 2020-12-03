// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <BandyerTestKit/BandyerTestKit.h>

@interface BTKStopwatchBridgingTests : BTKUnitTestCase

@end

@implementation BTKStopwatchBridgingTests

- (void)testStopwatchMethodsCanBeInvokedFromObjc
{
    BTKStopwatch *sut = [BTKStopwatch new];

    [sut start];
    [sut stop];

    XCTAssertTrue(sut.elapsedTimeInNanoseconds > 0);
}

@end

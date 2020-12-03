// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import <OCHamcrest/OCHamcrest.h>

#import "BTKUnitTestCase.h"
#import "UIControl+SimulateEvent.h"

@interface UIControl_SimulateEventBridgingTests : BTKUnitTestCase

@end

@implementation UIControl_SimulateEventBridgingTests
{
    BOOL actionInvoked;
}

- (void)testSimulateEventIsInvokableFromObjC
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];

    [button simulateEvent:UIControlEventTouchUpInside];

    assertThatBool(actionInvoked, isTrue());
}

- (void)action
{
    actionInvoked = YES;
}

@end

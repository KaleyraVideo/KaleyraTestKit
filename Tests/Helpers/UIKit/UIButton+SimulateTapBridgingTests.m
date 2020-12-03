// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import <OCHamcrest/OCHamcrest.h>

#import "BTKUnitTestCase.h"
#import "UIButton+SimulateTap.h"

@interface UIButton_SimulateTapBridgingTests : BTKUnitTestCase

@end

@implementation UIButton_SimulateTapBridgingTests
{
    BOOL didTouchDown;
    BOOL didTouchUpInside;
}

- (void)testSimulateTapIsInvocableFromObjc
{
    UIButton *sut = [[UIButton alloc] initWithFrame:CGRectZero];
    [sut addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [sut addTarget:self action:@selector(touchUpInside) forControlEvents:UIControlEventTouchUpInside];

    [sut simulateTap];

    assertThatBool(didTouchDown, isTrue());
    assertThatBool(didTouchUpInside, isTrue());
}

- (void)touchDown
{
    didTouchDown = YES;
}

- (void)touchUpInside
{
    didTouchUpInside = YES;
}

@end

// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import <OCHamcrest/OCHamcrest.h>
#import <BandyerTestKit/BandyerTestKit.h>

@interface UIAlertController_ActionRetrievalBridgingTests : BTKUnitTestCase

@end

@implementation UIAlertController_ActionRetrievalBridgingTests

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 140000

- (void)testFindActionIdentifiedByIsInvocableFromObjc
{
    BTKRunIfOSVersionAtLeast(14, "UIAlertAction gained accessibilityIdenfier in iOS 14",
         UIAlertController *sut = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction *action = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:nil];
         action.accessibilityIdentifier = @"cancel";
         [sut addAction:action];

         UIAlertAction *actualAction = [sut findActionIdentifiedBy:@"cancel"];

         assertThat(actualAction, notNilValue());
    );
}

#else

- (void)testFindActionIdentifiedByIsInvocableFromObjc
{
#ifdef XCTSkip
    XCTSkip(@"UIAlertAction gained accessibilityIdenfier in iOS 14. Skipping this test when compiling against older iOS SDKs");
#endif
}

#endif

- (void)testFindActionByTitleIsInvocableFromObjc
{
    UIAlertController *sut = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"title" style:UIAlertActionStyleCancel handler:nil];
    [sut addAction:action];

    UIAlertAction *actualAction = [sut findActionByTitle:@"title"];

    assertThat(actualAction, notNilValue());
}

@end

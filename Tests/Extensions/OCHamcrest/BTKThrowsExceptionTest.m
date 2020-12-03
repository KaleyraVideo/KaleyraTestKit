// Copyright © 2018 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#import <OCHamcrest/OCHamcrest.h>
#import <BandyerTestKit/BandyerTestKit.h>

@interface BTKThrowsExceptionTest : BTKUnitTestCase

@end

@implementation BTKThrowsExceptionTest


- (void)testThrowsInvalidArgumentException_ShouldMatch
{
    assertThat(^{[NSException raise:NSInvalidArgumentException format:@"An invalid argument exception"];}, throwsInvalidArgumentException());
}

- (void)testThrowsInternalInconsistencyException_ShouldMatch
{
    assertThat(^{[NSException raise:NSInternalInconsistencyException format:@"An internal inconsistency exception"];}, throwsInternalInconsistencyException());
}

@end

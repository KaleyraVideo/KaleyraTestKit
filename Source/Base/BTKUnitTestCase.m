// Copyright © 2019 Bandyer S.r.l. All Rights Reserved
// See LICENSE.txt for licensing information

#import "BTKUnitTestCase.h"

@implementation BTKUnitTestCase

- (void)setUp
{
    [super setUp];

    self.continueAfterFailure = NO;
}

@end

@implementation BTKUnitTestCase(DummyErrors)

- (NSError *)dummyError
{
    return [NSError errorWithDomain:@"com.bandyer.errors_test_dummy" code:1 userInfo:nil];
}

@end

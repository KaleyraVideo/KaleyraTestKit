// Copyright © 2018 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#import <OCHamcrest/OCHamcrest.h>
#import <BandyerTestKit/BandyerTestKit.h>

@interface BTKGeometryAssertTest : BTKUnitTestCase

@end

@implementation BTKGeometryAssertTest

- (void)testAssertThatCGSize_GivenSameSizes_ShouldMatch
{
    CGSize size1 = CGSizeMake(10, 20);
    CGSize size2 = CGSizeMake(10, 20);

    assertThatCGSize(size1, equalToCGSize(size2));
}

- (void)testAssertThatCGSize_GivenDifferentSize_ShouldNotMatch
{
    CGSize size1 = CGSizeMake(10, 20);
    CGSize size2 = CGSizeMake(20, 10);

    assertThatCGSize(size1, isNot(equalToCGSize(size2)));
}

- (void)testAssertThatCGSize_GivenEqualToMatcher_ShouldMatch
{
    CGSize size1 = CGSizeMake(10, 20);
    CGSize size2 = CGSizeMake(10, 20);

    assertThatCGSize(size1, equalTo([NSValue valueWithCGSize:size2]));
}

- (void)testAssertThatCGSize_GivenUnexpectedMatcher_ShouldNotMatch
{
    CGSize size1 = CGSizeMake(10, 20);

    assertThatCGSize(size1, isNot(containsIn(@[@"10"])));
}

- (void)testAssertThatCGPoint_GivenSamePoints_ShouldMatch
{
    CGPoint point1 = CGPointMake(1, 1);
    CGPoint point2 = CGPointMake(1, 1);

    assertThatCGPoint(point1, equalToCGPoint(point2));
}

- (void)testAssertThatCGPoint_GivenDifferentPoints_ShouldNotMatch
{
    CGPoint point1 = CGPointMake(1, 1);
    CGPoint point2 = CGPointMake(2, 2);

    assertThatCGPoint(point1, isNot(equalToCGPoint(point2)));
}

- (void)testAssertThatCGPoint_GivenUnexpectedMatcher_ShouldNotMatch
{
    CGPoint point1 = CGPointMake(1, 1);

    assertThatCGPoint(point1, isNot(containsIn(@[@"10"])));
}

- (void)testAssertThatCGRect_GivenSameRects_ShouldMatch
{
    CGRect rect1 = CGRectMake(1, 1, 10, 10);
    CGRect rect2 = CGRectMake(1, 1, 10, 10);

    assertThatCGRect(rect1, equalToCGRect(rect2));
}

- (void)testAssertThatCGRect_GiveDifferentRects_ShouldNotMatch
{
    CGRect rect1 = CGRectMake(1, 1, 10, 10);
    CGRect rect2 = CGRectMake(1, 1, 20, 20);

    assertThatCGRect(rect1, isNot(equalToCGRect(rect2)));
}

- (void)testAssertThatUIEdgeInsets_GivenSameInsets_ShouldMatch
{
    UIEdgeInsets insets1 = UIEdgeInsetsMake(1, 1, 1, 1);
    UIEdgeInsets insets2 = UIEdgeInsetsMake(1, 1, 1, 1);

    assertThatUIEdgeInsets(insets1, equalToUIEdgeInsets(insets2));
}

- (void)testAssertThatUIEdgeInsets_GivenDifferentInsets_ShouldNotMatch
{
    UIEdgeInsets insets1 = UIEdgeInsetsMake(1, 1, 1, 1);
    UIEdgeInsets insets2 = UIEdgeInsetsMake(2, 2, 1, 1);

    assertThatUIEdgeInsets(insets1, isNot(equalToUIEdgeInsets(insets2)));
}

@end

// Copyright © 2018 Bandyer. All rights reserved.
// See LICENSE.txt for licensing information

#import <OCHamcrest/OCHamcrest.h>
#import <BandyerTestKit/BandyerTestKit.h>

@interface BTKIsEqualToGeometryValueTest : BTKUnitTestCase

@end

@implementation BTKIsEqualToGeometryValueTest

- (void)testEqualToCGSize_GivenSameCGSize_ShouldMatch
{
    CGSize size = CGSizeMake(1, 1);
    NSValue *sizeValue = [NSValue valueWithCGSize:size];

    assertThat(sizeValue, equalToCGSize(CGSizeMake(1, 1)));
}

- (void)testIsNotEqualToCGSize_GivenDifferentCGSize_ShouldNotMatch
{
    CGSize size = CGSizeMake(200, 300);
    NSValue *sizeValue = [NSValue valueWithCGSize:size];

    assertThat(sizeValue, isNot(equalToCGSize(CGSizeMake(300, 200))));
}

- (void)testEqualToCGPoint_GivenSameCGPoint_ShouldMatch
{
    CGPoint point = CGPointMake(1, 1);
    NSValue *pointValue = [NSValue valueWithCGPoint:point];

    assertThat(pointValue, equalToCGPoint(CGPointMake(1, 1)));
}

- (void)testIsNotEqualToCGPoint_GivenDifferentCGPoint_ShouldNotMatch
{
    CGPoint point = CGPointMake(1, 1);
    NSValue *pointValue = [NSValue valueWithCGPoint:point];

    assertThat(pointValue, isNot(equalToCGPoint(CGPointMake(2, 2))));
}

- (void)testEqualToCGPoint_WhenMatchedAgainstCGSize_ShouldNotMatch
{
    CGSize size = CGSizeMake(1, 1);
    NSValue *sizeValue = [NSValue valueWithCGSize:size];

    assertThat(sizeValue, isNot(equalToCGPoint(CGPointMake(1, 1))));
}

- (void)testEqualToCGRect_GivenSameCGRect_ShouldMatch
{
    CGRect rect = CGRectMake(1, 1, 10, 10);
    NSValue *rectValue = [NSValue valueWithCGRect:rect];

    assertThat(rectValue, equalToCGRect(CGRectMake(1, 1, 10, 10)));
}

- (void)testEqualToCGRect_GivenDifferentCGRect_ShouldNotMatch
{
    CGRect rect = CGRectMake(1, 1, 10, 10);
    NSValue *rectValue = [NSValue valueWithCGRect:rect];

    assertThat(rectValue, isNot(equalToCGRect(CGRectMake(1, 1, 20, 20))));
}

- (void)testEqualToUIEdgeInsets_GivenSameInsets_ShouldMatch
{
    UIEdgeInsets insets = UIEdgeInsetsMake(1, 1, 1, 1);
    NSValue *insetsValue = [NSValue valueWithUIEdgeInsets:insets];

    assertThat(insetsValue, equalToUIEdgeInsets(UIEdgeInsetsMake(1, 1, 1, 1)));
}

- (void)testEqualToUIEdgeInsets_GivenDifferentInsets_ShouldNotMatch
{
    UIEdgeInsets insets = UIEdgeInsetsMake(1, 1, 1, 1);
    NSValue *insetsValue = [NSValue valueWithUIEdgeInsets:insets];

    assertThat(insetsValue, isNot(equalToUIEdgeInsets(UIEdgeInsetsMake(2, 2, 2, 2))));
}

@end

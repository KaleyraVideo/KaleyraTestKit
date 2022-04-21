// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(GestureRecognizerActionsInvoker)
@interface BTKGestureRecognizerActionsInvoker : NSObject

- (void)invokeActions:(UIGestureRecognizer *)recognizer NS_SWIFT_NAME(invokeActions(on:));

@end

NS_ASSUME_NONNULL_END

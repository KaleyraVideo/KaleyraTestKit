// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(GestureRecognizerActionsInvoker)
@interface BTKGestureRecognizerActionsInvoker : NSObject

- (void)invokeActions:(UIGestureRecognizer *)recognizer NS_SWIFT_NAME(invokeActions(on:));

@end

NS_ASSUME_NONNULL_END

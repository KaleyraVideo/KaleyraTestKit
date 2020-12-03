// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

#import "BTKGestureRecognizerActionsInvoker.h"

#import <objc/runtime.h>
#import <objc/message.h>

@implementation BTKGestureRecognizerActionsInvoker

- (void)invokeActions:(UIGestureRecognizer *)recognizer
{
    Class gestureRecogniserTarget = NSClassFromString(@"UIGestureRecognizerTarget");
    Ivar targetIvar = class_getInstanceVariable(gestureRecogniserTarget, "_target");
    Ivar actionIvar = class_getInstanceVariable(gestureRecogniserTarget, "_action");
    
    for (id gestureRecogniserTarget in [recognizer valueForKey:@"targets"]) {
        id target = object_getIvar(gestureRecogniserTarget, targetIvar);
        SEL action = (__bridge void *)object_getIvar(gestureRecogniserTarget, actionIvar);
        void (*actionMethod)(id, SEL, id) = (void (*)(id, SEL, id))objc_msgSend;
        actionMethod(target, action, recognizer);
    }
}

@end

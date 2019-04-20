//
//  Problem108_ShiftedString.m
//  Interview
//
//  Created by Nick Eliason on 3/24/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem108_ShiftedString.h"

@implementation Problem108_ShiftedString

/*
 This problem was asked by Google.
 
 Given two strings A and B, return whether or not A can be shifted some number of times to get B.
 
 For example, if A is abcde and B is cdeab, return true. If A is abc and B is acb, return false.
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", [self isShifted:@"abcde" :@"cdeab"] ? @"YES" : @"NO");
        NSLog(@"%@", [self isShifted:@"abc" :@"acb"] ? @"YES" : @"NO");
    }
    return self;
}

-(BOOL)isShifted:(NSString *)A :(NSString *)B {
    if (A.length != B.length) {
        return NO;
    }
    for (int i = 0; i < A.length; i++) {
        if ([A characterAtIndex:i] != [B characterAtIndex:0]) {
            continue;
        }
        NSString *start = [A substringFromIndex:i];
        if ([B hasPrefix:start]) {
            NSString *end = [A substringToIndex:i];
            if ([B hasSuffix:end]) {
                return YES;
            }
        }
    }
    return NO;
}

@end

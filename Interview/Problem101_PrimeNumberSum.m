//
//  Problem101_PrimeNumberSum.m
//  Interview
//
//  Created by Nick Eliason on 3/17/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem101_PrimeNumberSum.h"

@implementation Problem101_PrimeNumberSum

/*
 This problem was asked by Alibaba.
 
 Given an even number (greater than 2), return two prime numbers whose sum will be equal to the given number.
 
 A solution will always exist. See Goldbach’s conjecture.
 
 Example:
 
 Input: 4
 Output: 2 + 2 = 4
 If there are more than one solution possible, return the lexicographically smaller solution.
 
 If [a, b] is one solution with a <= b, and [c, d] is another solution with c <= d, then
 
 [a, b] < [c, d]
 If a < c OR a==c AND b < d.
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", [self primeNumberSum:620]);
    }
    return self;
}

- (NSArray<NSNumber*>*)primeNumberSum:(int)num {
    for (int i = 2; i <= num/2; i++) {
        if ([self isPrime:i] && [self isPrime:num-i]) {
            NSNumber *prime1 = [[NSNumber alloc] initWithInt:i];
            NSNumber *prime2 = [[NSNumber alloc] initWithInt:num-i];
            return [[NSArray alloc] initWithObjects:prime1,prime2,nil];
        }
    }
    return nil;
}

- (BOOL)isPrime:(int)num {
    if (num <= 1) return NO;
    if (num == 2) return YES;
    if (num % 2 == 0) return NO;
    for (int i = 3; i <= sqrt(num);i++) {
        if (num % i == 0) {
            return NO;
        }
    }
    return YES;
}

@end

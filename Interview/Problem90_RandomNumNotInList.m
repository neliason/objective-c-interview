//
//  Problem90_RandomNumNotInList.m
//  Interview
//
//  Created by Nick Eliason on 3/6/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//


/*
 
 This question was asked by Google.
 
 Given an integer n and a list of integers l, write a function that randomly generates a number from 0 to n-1 that isn't in l (uniform).
 
 keep generating random numbers till one not in list
    this could be an infinite loop if all are in list
 
 
*/

#import "Problem90_RandomNumNotInList.h"

@implementation Problem90_RandomNumNotInList

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *arr = @[@1,@2,@4,@5];
        NSLog(@"Problem90_RandomNumNotInList: %d", [self randomNumNotInList:arr :6]);
    }
    return self;
}

- (int)randomNumNotInList:(NSArray *)list :(int)n {
    int indexOfN = (int)[list count];
    for (int i = 0; i < [list count]; i++) {
        if ([list[i] intValue] >= n) {
            indexOfN = i;
            break;
        }
    }
    NSArray *listUpToN = [list subarrayWithRange:NSMakeRange(0, indexOfN)];
    if ([listUpToN count] >= n) {
        return -1;
    }
    return [self randomNumNotInListHelper:listUpToN :n];
}

- (int)randomNumNotInListHelper:(NSArray *)list :(int)n {
    NSNumber *randInt = [NSNumber numberWithUnsignedInteger:arc4random_uniform(n)];
    if ([list containsObject:randInt]) {
        return [self randomNumNotInListHelper:list :n];
    }
    return [randInt intValue];
}

@end

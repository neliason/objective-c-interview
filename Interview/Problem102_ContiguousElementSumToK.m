//
//  Problem102_ContiguousElementSumToK.m
//  Interview
//
//  Created by Nick Eliason on 3/18/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem102_ContiguousElementSumToK.h"

@implementation Problem102_ContiguousElementSumToK

/*
 This problem was asked by Lyft.
 
 Given a list of integers and a number K, return which contiguous elements of the list sum to K.
 
 For example, if the list is [1, 2, 3, 4, 5] and K is 9, then it should return [2, 3, 4], since 2 + 3 + 4 = 9.
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", [self contiguousElementsSumToK:@[@1,@2,@3,@4,@5] K:9]);
        NSLog(@"%@", [self contiguousElementsSumToK:@[@1,@2,@3,@4] K:9]);
        NSLog(@"%@", [self contiguousElementsSumToK:@[@1,@7,@-1,@3,@4] K:9]);
        NSLog(@"%@", [self contiguousElementsSumToK:@[@1,@2,@3,@9] K:9]);
        NSLog(@"%@", [self contiguousElementsSumToK:@[@10,@11,@12,@9] K:9]);
        NSLog(@"%@", [self contiguousElementsSumToK:@[@9] K:9]);
        NSLog(@"%@", [self contiguousElementsSumToK:@[@10] K:9]);
        NSLog(@"%@", [self contiguousElementsSumToK:@[@8] K:9]);
    }
    return self;
}

- (NSArray<NSNumber*> *)contiguousElementsSumToK:(NSArray<NSNumber*> *)arr K:(int)K {
    NSMutableDictionary<NSNumber *,NSNumber *> *dict = [[NSMutableDictionary alloc] initWithCapacity:arr.count];
    int sum = 0;
    [dict setObject:@-1 forKey:@0];
    for (int endIndex = 0; endIndex < arr.count; endIndex++) {
        sum += arr[endIndex].intValue;
        [dict setObject:[NSNumber numberWithInt:endIndex] forKey:[NSNumber numberWithInt:sum]];
        NSNumber *startIndexNumber = [dict objectForKey:[NSNumber numberWithInt:sum-K]];
        if (startIndexNumber != nil) {
            int startIndex = startIndexNumber.intValue;
            return [arr subarrayWithRange:NSMakeRange(startIndex+1, endIndex-startIndex)];
        }
    }
    return nil;
}

- (NSArray<NSNumber*> *)contiguousElementsSumToKPositiveOnly:(NSArray<NSNumber*> *)arr K:(int)K {
    int curSum = arr[0].intValue;
    int startIndex = 0;
    int endIndex = 0;
    while (endIndex < arr.count) {
        if (curSum == K) {
            NSMutableArray *solution = [[NSMutableArray alloc] init];
            while (startIndex <= endIndex) {
                [solution addObject:arr[startIndex]];
                startIndex++;
            }
            return solution;
        }
        if (curSum < K || startIndex == endIndex) {
            endIndex++;
            if (endIndex < arr.count) {
                curSum += arr[endIndex].intValue;
            }
        } else {
            curSum -= arr[startIndex].intValue;
            startIndex++;
        }
    }
    return nil;
}

@end

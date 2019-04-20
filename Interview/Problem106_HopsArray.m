//
//  Problem106_HopsArray.m
//  Interview
//
//  Created by Nick Eliason on 3/22/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem106_HopsArray.h"

@implementation Problem106_HopsArray

/*
 This problem was asked by Pinterest.
 
 Given an integer list where each number represents the number of hops you can make, determine whether you can reach to the last index starting at index 0.
 
 For example, [2, 0, 1, 0] returns True while [1, 1, 0, 1] returns False.
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", [self canHopToEnd:@[@2,@0,@1,@0]] ? @"YES" : @"NO");
        NSLog(@"%@", [self canHopToEnd:@[@1,@1,@0,@1]] ? @"YES" : @"NO");
    }
    return self;
}

- (BOOL)canHopToEnd:(NSArray<NSNumber*>*)hopsArr {
    NSMutableArray<NSNumber*> *dp = [[NSMutableArray alloc] initWithCapacity:hopsArr.count];
    [dp addObject:[NSNumber numberWithBool:YES]];
    for (int i = hopsArr.count-2; i >= 0; i--) {
        int hops = hopsArr[i].intValue;
        while (hops > 0) {
            int index = i + hops;
            if (index >= hopsArr.count || dp[hops-1].boolValue) {
                [dp insertObject:[NSNumber numberWithBool:YES] atIndex:0];
                break;
            }
            hops--;
        }
        if (hops == 0) {
            [dp insertObject:[NSNumber numberWithBool:NO] atIndex:0];
        }
        
    }
    return dp[0].boolValue;
}

@end

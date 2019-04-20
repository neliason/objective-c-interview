//
//  Problem105_Debounce.m
//  Interview
//
//  Created by Nick Eliason on 3/22/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem105_Debounce.h"

@interface Problem105_Debounce()

@property (nonatomic, assign) BOOL isDebouncing;

@end

@implementation Problem105_Debounce

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isDebouncing = NO;
        [self debouce:^{
            NSLog(@"here");
        } time:10];
    }
    return self;
}

-(void)debouce:(void(^)())f time:(double)N {
//    static BOOL isDebouncing;
    if (!self.isDebouncing) {
        f();
        self.isDebouncing = YES;
    }
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:N repeats:NO block:^(NSTimer * _Nonnull timer) {
        self.isDebouncing = NO;
    }];
    [timer fire];
}

@end

//
//  Problem131_LinkedListNode.m
//  Interview
//
//  Created by Nick Eliason on 4/17/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem131_LinkedListNode.h"

@implementation Problem131_LinkedListNode

- (instancetype) initWithVal:(int)val {
    self = [super init];
    if (self) {
        self.val = val;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    id copy = [[[self class] alloc] init];
    if (copy) {
        [copy setNext:[self.next copyWithZone:zone]];
        [copy setRand:[self.rand copyWithZone:zone]];
        
        [copy setVal:self.val];
    }
    return copy;
}

@end

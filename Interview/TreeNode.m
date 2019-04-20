//
//  TreeNode.m
//  Interview
//
//  Created by Nick Eliason on 3/10/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithVal:(int)val
{
    self = [super init];
    if (self) {
        self.val = val;
    }
    return self;
}

@end

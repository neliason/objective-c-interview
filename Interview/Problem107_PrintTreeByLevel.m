//
//  Problem107_PrintTreeByLevel.m
//  Interview
//
//  Created by Nick Eliason on 3/23/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem107_PrintTreeByLevel.h"
#import "TreeNode.h"

@implementation Problem107_PrintTreeByLevel

/*
 This problem was asked by Microsoft.
 
 Print the nodes in a binary tree level-wise. For example, the following should print 1, 2, 3, 4, 5.
 
   1
  / \
 2   3
    / \
   4   5

*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        TreeNode *root = [[TreeNode alloc] initWithVal:-10];
        root.left = [[TreeNode alloc] initWithVal:3];
        root.right = [[TreeNode alloc] initWithVal:-2];
        root.right.left = [[TreeNode alloc] initWithVal:-4];
        root.right.right = [[TreeNode alloc] initWithVal:50];
        [self printByLevel:root];
    }
    return self;
}

-(void)printByLevel:(TreeNode*)root {
    NSMutableArray<TreeNode*> *queue = [[NSMutableArray alloc] init];
    [queue addObject:root];
    while (queue.count > 0) {
        TreeNode *curNode = [queue objectAtIndex:0];
        [queue removeObjectAtIndex:0];
        NSLog(@"%d", curNode.val);
        if (curNode.left) {
            [queue addObject:curNode.left];
        }
        if (curNode.right) {
            [queue addObject:curNode.right];
        }
    }
}

@end

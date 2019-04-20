//
//  Problem110_LeafPathsInTree.m
//  Interview
//
//  Created by Nick Eliason on 3/29/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem110_LeafPathsInTree.h"
#import "TreeNode.h"

@implementation Problem110_LeafPathsInTree

/*
 This problem was asked by Facebook.
 
 Given a binary tree, return all paths from the root to leaves.
 
 For example, given the tree:
 
    1
   / \
  2   3
     / \
    4   5
 Return [[1, 2], [1, 3, 4], [1, 3, 5]].
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        TreeNode *root = [[TreeNode alloc] initWithVal:1];
        root.left = [[TreeNode alloc] initWithVal:2];
        root.right = [[TreeNode alloc] initWithVal:3];
        root.right.left = [[TreeNode alloc] initWithVal:4];
        root.right.right = [[TreeNode alloc] initWithVal:5];
        NSLog(@"%@", [self leafPaths:root]);
    }
    return self;
}

- (NSArray *)leafPaths:(TreeNode *)root {
    NSMutableArray *solution = [[NSMutableArray alloc] init];
    [self leafPathsHelper:root CurPath:[[NSMutableArray alloc] init] Solution:solution];
    return solution;
}

- (void)leafPathsHelper:(TreeNode *)root CurPath:(NSMutableArray<NSNumber*>*)curPath Solution:(NSMutableArray<NSArray<NSNumber*>*>*)solution {
    if (root == nil) return;
    [curPath addObject:[NSNumber numberWithInt:root.val]];
    if (root.left == nil && root.right == nil) {
        [solution addObject:[curPath copy]];
    } else {
        [self leafPathsHelper:root.left CurPath:curPath Solution:solution];
        [self leafPathsHelper:root.right CurPath:curPath Solution:solution];
    }
    [curPath removeLastObject];
}

@end

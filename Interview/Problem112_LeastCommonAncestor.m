//
//  Problem112_LeastCommonAncestor.m
//  Interview
//
//  Created by Nick Eliason on 3/29/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem112_LeastCommonAncestor.h"
#import "TreeNode.h"

@implementation Problem112_LeastCommonAncestor

/*
 This problem was asked by Twitter.
 
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree. Assume that each node in the tree also has a pointer to its parent.
 
 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (where we allow a node to be a descendant of itself).”
*/

typedef struct {
    // this should really be in a class, structs with object pointers dont work well with ARC
    TreeNode *node;
    BOOL found;
} Solution;

- (instancetype)init
{
    self = [super init];
    if (self) {
        TreeNode *n1 = [[TreeNode alloc] initWithVal:1];
        TreeNode *n2 = [[TreeNode alloc] initWithVal:2];
        TreeNode *n3 = [[TreeNode alloc] initWithVal:3];
        TreeNode *n4 = [[TreeNode alloc] initWithVal:4];
        TreeNode *n5 = [[TreeNode alloc] initWithVal:5];
        TreeNode *n6 = [[TreeNode alloc] initWithVal:6];
        TreeNode *n7 = [[TreeNode alloc] initWithVal:7];
        TreeNode *n8 = [[TreeNode alloc] initWithVal:8];
        TreeNode *n9 = [[TreeNode alloc] initWithVal:9];
        n1.left = n2;
        n2.left = n5;
        n2.right = n3;
        n5.left = n8;
        n5.right = n6;
        n6.left = n7;
        n3.left = n4;
        n3.right = n9;
        NSLog(@"%d", [self leastCommonAncestor:n1 Node1:n1 Node2:n9].val);
    }
    return self;
}

- (TreeNode *)leastCommonAncestor:(TreeNode *)root Node1:(TreeNode *)n1 Node2:(TreeNode *)n2 {
    if (root == nil) return nil;
    Solution sol = [self leastCommonAncestorHelper:root Node1:n1 Node2:n2];
    return sol.node;
}

- (Solution)leastCommonAncestorHelper:(TreeNode *)root Node1:(TreeNode *)n1 Node2:(TreeNode *)n2 {
    Solution sol;
    sol.found = NO;
    sol.node = nil;
    if (root == nil) {
        return sol;
    }
    Solution leftSol = [self leastCommonAncestorHelper:root.left Node1:n1 Node2:n2];
    Solution rightSol = [self leastCommonAncestorHelper:root.right Node1:n1 Node2:n2];
    if (leftSol.node != nil) {
        sol.node = leftSol.node;
    } else if (rightSol.node != nil) {
        sol.node = rightSol.node;
    } else if ((leftSol.found && rightSol.found) || ((leftSol.found || rightSol.found) && (root == n1 || root == n2))) {
        sol.node = root;
    } else if (root == n1 || root == n2 || leftSol.found || rightSol.found) {
        sol.found = YES;
    } else {
        sol.found = NO;
    }
    return sol;
}

@end

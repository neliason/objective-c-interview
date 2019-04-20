//
//  Problem94_TreeMaxPathSum.m
//  Interview
//
//  Created by Nick Eliason on 3/10/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

/*
 This problem was asked by Google.
 
 Given a binary tree of integers, find the maximum path sum between two nodes. The path must go through at least one node, and does not need to go through the root.
*/

#import "Problem94_TreeMaxPathSum.h"

@implementation Problem94_TreeMaxPathSum

typedef struct {
    int fullPath;
    int partPath;
} Solution;

+ (int)maxPathSum:(TreeNode *)root {
    Solution solution = [self maxPathSumHelper:root];
    int maxPath = MAX(solution.fullPath, solution.partPath);
    return maxPath;
}

+ (Solution)maxPathSumHelper:(TreeNode *)root {
    Solution sol;
    if (root == nil) {
        sol.fullPath = 0;
        sol.partPath = 0;
        return sol;
    }
    Solution leftSol = [self maxPathSumHelper:root.left];
    Solution rightSol = [self maxPathSumHelper:root.right];
    sol.fullPath = MAX(MAX(MAX(MAX(root.val + leftSol.partPath + rightSol.partPath, leftSol.fullPath), rightSol.fullPath),leftSol.partPath),rightSol.partPath);
    sol.partPath = root.val + MAX(leftSol.partPath, rightSol.partPath);
    return sol;
}

@end

//
//  main.m
//  Interview
//
//  Created by Nick Eliason on 3/6/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Problem90_RandomNumNotInList.h"
#import "TreeNode.h"
#import "Problem94_TreeMaxPathSum.h"
#import "AddBinaryNumbers.h"
#import "Problem101_PrimeNumberSum.h"
#import "Problem102_ContiguousElementSumToK.h"
#import "Problem103_ShortestSubstringContainingCharacters.h"
#import "Problem105_Debounce.h"
#import "Problem106_HopsArray.h"
#import "Problem107_PrintTreeByLevel.h"
#import "Problem108_ShiftedString.h"
#import "Problem110_LeafPathsInTree.h"
#import "Problem112_LeastCommonAncestor.h"
#import "Problem131_LinkedListWithRandomsDeepClone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        [[Problem90_RandomNumNotInList alloc] init];
    
        
        TreeNode *root = [[TreeNode alloc] initWithVal:-10];
        root.left = [[TreeNode alloc] initWithVal:3];
        root.right = [[TreeNode alloc] initWithVal:-2];
        root.left.left = [[TreeNode alloc] initWithVal:-4];
        root.left.right = [[TreeNode alloc] initWithVal:50];
        NSLog(@"%d", [Problem94_TreeMaxPathSum maxPathSum:root]);
        
//        [[AddBinaryNumbers alloc] init];
//        [[Problem101_PrimeNumberSum alloc] init];
//        [[Problem102_ContiguousElementSumToK alloc] init];
//        [[Problem103_ShortestSubstringContainingCharacters alloc] init];
//        [[Problem105_Debounce alloc] init];
//        [[Problem106_HopsArray alloc] init];
//        [[Problem107_PrintTreeByLevel alloc] init];
//        [[Problem108_ShiftedString alloc] init];
//        [[Problem110_LeafPathsInTree alloc] init];
//        [[Problem112_LeastCommonAncestor alloc] init];
        [[Problem131_LinkedListWithRandomsDeepClone alloc] init];
    }
    return 0;
}

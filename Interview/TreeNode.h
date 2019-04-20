//
//  TreeNode.h
//  Interview
//
//  Created by Nick Eliason on 3/10/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (nonatomic, assign) int val;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) TreeNode *right;
- (instancetype)initWithVal:(int)val;

@end

NS_ASSUME_NONNULL_END

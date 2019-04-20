//
//  Problem131_LinkedListNode.h
//  Interview
//
//  Created by Nick Eliason on 4/17/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Problem131_LinkedListNode : NSObject <NSCopying>

@property (nonatomic, assign) int val;
@property (nonatomic, strong) Problem131_LinkedListNode *next;
@property (nonatomic, strong) Problem131_LinkedListNode *rand;
- (instancetype) initWithVal:(int)val;
- (id)copyWithZone:(NSZone *)zone;

@end

NS_ASSUME_NONNULL_END

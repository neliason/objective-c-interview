//
//  Problem131_LinkedListWithRandomsDeepClone.m
//  Interview
//
//  Created by Nick Eliason on 4/17/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem131_LinkedListWithRandomsDeepClone.h"
#import "Problem131_LinkedListNode.h"

@implementation Problem131_LinkedListWithRandomsDeepClone

/*
 This question was asked by Snapchat.
 
 Given the head to a singly linked list, where each node also has a “random” pointer that points to anywhere in the linked list, deep clone the list.
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        Problem131_LinkedListNode *head = [[Problem131_LinkedListNode alloc] initWithVal:1];
        Problem131_LinkedListNode *two = [[Problem131_LinkedListNode alloc] initWithVal:2];
        Problem131_LinkedListNode *three = [[Problem131_LinkedListNode alloc] initWithVal:3];
        Problem131_LinkedListNode *four = [[Problem131_LinkedListNode alloc] initWithVal:4];
        Problem131_LinkedListNode *five = [[Problem131_LinkedListNode alloc] initWithVal:5];
        head.next = two;
        two.next = three;
        three.next = four;
        four.next = five;
        head.rand = four;
        two.rand = three;
        three.rand = head;
        four.rand = five;
        five.rand = four;
        Problem131_LinkedListNode *cloneHead = [self deepClone:head];
        NSLog(@"%d, %d", cloneHead.val, cloneHead.rand.val);
    }
    return self;
}

- (Problem131_LinkedListNode *)deepClone:(Problem131_LinkedListNode *)head {
    Problem131_LinkedListNode *dummyHead = [[Problem131_LinkedListNode alloc] initWithVal:-1];
    Problem131_LinkedListNode *curNode = head;
    Problem131_LinkedListNode *curCloneNode = dummyHead;
    NSMutableDictionary<Problem131_LinkedListNode*,Problem131_LinkedListNode*> *createdDict = [[NSMutableDictionary alloc] init];
    while (curNode != nil) {
        if ([createdDict doesContain:curNode]) {
            curCloneNode.next = [createdDict objectForKey:curNode];
        } else {
            curCloneNode.next = [[Problem131_LinkedListNode alloc] initWithVal:curNode.val];
            [createdDict setObject:curCloneNode.next forKey:curNode];
        }
        curCloneNode = curCloneNode.next;
        if ([createdDict doesContain:curNode.rand]) {
            curCloneNode.rand = [createdDict objectForKey:curNode.rand];
        } else {
            curCloneNode.rand = [[Problem131_LinkedListNode alloc] initWithVal:curNode.rand.val];
            [createdDict setObject:curCloneNode.rand forKey:curNode.rand];
        }
        curNode = curNode.next;
    }
    return dummyHead.next;
}

@end

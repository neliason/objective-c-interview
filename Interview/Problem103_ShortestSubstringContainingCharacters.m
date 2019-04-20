//
//  Problem103_ShortestSubstringContainingCharacters.m
//  Interview
//
//  Created by Nick Eliason on 3/19/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "Problem103_ShortestSubstringContainingCharacters.h"

@implementation Problem103_ShortestSubstringContainingCharacters

/*
 This problem was asked by Square.
 
 Given a string and a set of characters, return the shortest substring containing all the characters in the set.
 
 For example, given the string "figehaeci" and the set of characters {a, e, i}, you should return "aeci".
 
 If there is no substring containing all the characters in the set, return null.
 
 
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@", [self shortestSubstringContainingCharacters:@"figehaeci" :[[NSSet alloc] initWithObjects:@"a",@"e",@"i",nil]]);
        NSLog(@"%@", [self shortestSubstringContainingCharacters:@"jbaabck" :[[NSSet alloc] initWithObjects:@"a",@"b",@"c",nil]]);
        NSLog(@"%@", [self shortestSubstringContainingCharacters:@"jbaabck" :[[NSSet alloc] initWithObjects:@"a",@"b",@"c",@"d",nil]]);
        NSLog(@"%@", [self shortestSubstringContainingCharacters:@"jbaabck" :[[NSSet alloc] initWithObjects:@"a",nil]]);
    }
    return self;
}

- (NSString *)shortestSubstringContainingCharacters:(NSString*)str :(NSSet<NSString*> *)chars {
    for (NSString *c in chars) {
//        NSLog(@"%@", c);
    }
    NSMutableDictionary<NSString*,NSNumber*> *dict = [[NSMutableDictionary alloc] initWithCapacity:chars.count];
    int shortestStart = 0;
    int shortestEnd = INT_MAX;
    int startIndex = 0;
    int endIndex = 0;
    while (endIndex < str.length) {
        NSString *c = [str substringWithRange:NSMakeRange(endIndex,1)];
        if ([chars containsObject:c]) {
            int newCount = [dict objectForKey:c] == nil ? 1 : [dict objectForKey:c].intValue+1;
            [dict setObject:[NSNumber numberWithInt:newCount] forKey:c];
            while (dict.allKeys.count == chars.count) {
                if (endIndex - startIndex < shortestEnd - shortestStart) {
                    shortestStart = startIndex;
                    shortestEnd = endIndex;
                }
                NSString *startChar = [str substringWithRange:NSMakeRange(startIndex,1)];
                if ([chars containsObject:startChar]) {
                    int count = [dict objectForKey:startChar].intValue-1;
                    if (count == 0) {
                        [dict removeObjectForKey:startChar];
                    } else {
                        [dict setObject:[NSNumber numberWithInt:count] forKey:startChar];
                    }
                }
                startIndex++;
            }
        }
        endIndex++;
    }
    return shortestEnd == INT_MAX ? nil : [str substringWithRange:NSMakeRange(shortestStart, shortestEnd-shortestStart+1)];
}

@end

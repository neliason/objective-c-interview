//
//  AddBinaryNumbers.m
//  Interview
//
//  Created by Nick Eliason on 3/16/19.
//  Copyright © 2019 Nick Eliason. All rights reserved.
//

#import "AddBinaryNumbers.h"

@implementation AddBinaryNumbers

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *str1 = @"111";
        NSString *str2 = @"1";
        NSLog(@"%@", [self addBinaryNumbers:str1:str2]);
    }
    return self;
}

- (NSString *) addBinaryNumbers:(NSString *)num1 :(NSString *)num2 {
    NSUInteger capacity = MAX(num1.length,num2.length) + 1;
    NSMutableString *result = [[NSMutableString alloc] initWithCapacity:capacity];
    NSInteger index1 = num1.length - 1;
    NSInteger index2 = num2.length - 1;
    int carry = 0;
    while (index1 >= 0 && index2 >= 0) {
        int digit1 = [[num1 substringWithRange:NSMakeRange(index1, 1)] intValue];
        int digit2 = [[num2 substringWithRange:NSMakeRange(index2, 1)] intValue];
        int intermediate = digit1 + digit2 + carry;
        int sum = intermediate % 2;
        carry = intermediate > 1 ? 1 : 0;
        [result appendString:[NSString stringWithFormat:@"%d",sum]];
        index1--;
        index2--;
    }
    while (index1 >= 0) {
        int digit1 = [[num1 substringWithRange:NSMakeRange(index1, 1)] intValue];
        int intermediate = digit1 + carry;
        int sum = intermediate % 2;
        carry = intermediate > 1 ? 1 : 0;
        [result appendString:[NSString stringWithFormat:@"%d",sum]];
        index1--;
    }
    while (index2 >= 0) {
        int digit2 = [[num1 substringWithRange:NSMakeRange(index2, 1)] intValue];
        int intermediate = digit2 + carry;
        int sum = intermediate % 2;
        carry = intermediate > 1 ? 1 : 0;
        [result appendString:[NSString stringWithFormat:@"%d",sum]];
        index2--;
    }
    if (carry == 1) {
        [result appendString:@"1"];
    }
    
    return [self reverse:[result copy]];
}

- (NSString *)reverse:(NSString *)myString {
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [myString length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[myString substringWithRange:subStrRange]];
    }
    return [reversedString copy];
}

@end

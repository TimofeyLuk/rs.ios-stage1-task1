//
//  NSMutableArray.m
//  RSSchool_T1
//
//  Created by Тимофей Лукашевич on 3/11/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "NSMutableArray.h"

@implementation NSMutableArray (MinMax)

-(int) minElementIndex
{
    int index = 0;
    if (self.count == 0) {
        @throw [NSException
        exceptionWithName:@"Index can't be found"
        reason:@"Array is empty"
        userInfo:nil];
    }
    for (int i = 0; i < self.count; i += 1) {
        if ([[self objectAtIndex: i] intValue] <= [[self objectAtIndex: index] intValue]) {
            index = i;
        }
    }
    return index;
}
-(int) maxElementIndex
{
    int index = 0;
    if (self.count == 0) {
        @throw [NSException
        exceptionWithName:@"Index can't be found"
        reason:@"Array is empty"
        userInfo:nil];
    }
    for (int i = 0; i < self.count; i += 1) {
           if ([[self objectAtIndex: i] intValue] > [[self objectAtIndex: index] intValue]) {
               index = i;
           }
       }
    return index;
}


@end

#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    NSMutableArray *wokrArray = [T1Array getWorkArrayWithArray: sadArray];
    NSMutableArray *arrayForResult = [[NSMutableArray alloc] initWithArray: @[]];
    if (sadArray.count != 0) {
        [arrayForResult addObject: [sadArray objectAtIndex:0]];
    }
    NSMutableArray *previousResult = [[NSMutableArray alloc] initWithArray: @[]];
    
    while (![arrayForResult isEqualToArray: previousResult] && sadArray.count != 0) {
        previousResult = [arrayForResult copy];
        arrayForResult = [[NSMutableArray alloc] initWithArray: @[]];;
        for (int i = 1; i <= wokrArray.count - 2; i += 1) {
            
            if ([[wokrArray objectAtIndex: i] intValue] < [[wokrArray objectAtIndex: i - 1] intValue] + [[wokrArray objectAtIndex: i + 1] intValue] || i == wokrArray.count-2 || i == 1) {
                
                [arrayForResult addObject:[wokrArray objectAtIndex:i]];
                
            }
        }
        wokrArray = [T1Array getWorkArrayWithArray: arrayForResult];
    }
    
    return arrayForResult;
}

+ (NSMutableArray*) getWorkArrayWithArray: (NSArray *)previousResult {
    
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray: @[@0]];
    [result addObjectsFromArray:previousResult];
    [result addObject: @0];
    return result;
}

@end

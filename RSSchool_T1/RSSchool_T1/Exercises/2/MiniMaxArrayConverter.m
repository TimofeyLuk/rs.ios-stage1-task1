#import "MiniMaxArrayConverter.h"
#import "NSMutableArray.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray *arrayCopyForMin = [[NSMutableArray alloc] initWithArray: [array copy]];
    [arrayCopyForMin removeObjectAtIndex: [arrayCopyForMin maxElementIndex]];
    NSMutableArray *arrayCopyForMax = [[NSMutableArray alloc] initWithArray: [array copy]];
    [arrayCopyForMax removeObjectAtIndex: [arrayCopyForMax minElementIndex]];
    
    return @[ [MiniMaxArrayConverter sumOfElementsOfArray:arrayCopyForMin],  [MiniMaxArrayConverter sumOfElementsOfArray:arrayCopyForMax],];
}

+ (NSNumber *) sumOfElementsOfArray: (NSArray<NSNumber*>*)array {
    
    int result = 0;
    for (NSNumber *el in array) {
        
        result += [el intValue];
    }
    
    return [[NSNumber alloc] initWithInt: result];
}

@end


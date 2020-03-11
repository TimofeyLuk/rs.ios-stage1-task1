#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSMutableArray *orderWithoutAnnDish = [[NSMutableArray alloc] initWithArray: bill];
    [orderWithoutAnnDish removeObjectAtIndex:index];
    int AnnSum = [BillCounter sumOfElementsOfArray: orderWithoutAnnDish] / 2;
    
    if ([sum intValue] == AnnSum)
    {
        return  @"Bon Appetit";
    }
    else
    {
        return [NSString stringWithFormat:@"%d", [sum intValue] - AnnSum];
    }
}

+ (int) sumOfElementsOfArray: (NSArray<NSNumber*>*)array {
    
    int result = 0;
    for (NSNumber *el in array) {
        
        result += [el intValue];
    }
    
    return result;
}

@end

#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:@[]];
    [s enumerateSubstringsInRange:(NSRange){0, [s length]} options: NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {[arr addObject:substring];}];
    
    int chengeCount = 0;
    long previouseMax = 0;
    
    for (long i = ([n intValue] / 2); i >= 0; i -= 1) {
        
        NSInteger firstElement = [[arr objectAtIndex: i] integerValue];
        NSInteger secondElement = [[arr objectAtIndex: ([n intValue] - i - 1) ] integerValue];
        if (firstElement != secondElement) {
            long max = MAX(previouseMax,MAX(firstElement, secondElement));
            previouseMax = max;
            if (firstElement != max) {
                chengeCount += 1;
            }
            if (secondElement != max) {
                chengeCount += 1;
            }
            arr[i] = [NSString stringWithFormat:@"%ld", max];
            arr[([n intValue] - i - 1)] = [NSString stringWithFormat:@"%ld", max];
        }
        
    }
    
    
    return  chengeCount == [k intValue] ? [arr componentsJoinedByString:@""] : @"-1";
}

@end

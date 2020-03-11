#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
 
    NSMutableArray *result = [[NSMutableArray alloc] initWithArray: @[]];
    NSString *pattern = @"(<(\\s*|.)+>)|(\\[(\\s*|.)+\\])|(\\((\\s*|.)+\\))";
    NSArray *closedScopeCharacters = @[@"]",@">",@")"];
    NSRegularExpressionOptions regexOptions = NSRegularExpressionCaseInsensitive;
      NSError* error = NULL;
      NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                      options:regexOptions
                                         error:&error];
    NSRange march = [regex rangeOfFirstMatchInString: string options:0 range:NSMakeRange(0, [string length])];
    NSMutableString *copy = [NSMutableString stringWithFormat:@"%@", string];
    
    while (!NSEqualRanges(march, NSMakeRange(NSNotFound, 0))) {

        NSMutableString *tempStr = [NSMutableString stringWithFormat:@"%@", [copy substringWithRange:march] ];
        
         if(![Parser isScopeCloused:tempStr]) {
             
            NSRange tempRange = [copy rangeOfString: tempStr];
           for (int i = tempRange.location + tempRange.length; i < [copy length]; i++) {
              
              NSString *currentCharacter = [copy substringWithRange:NSMakeRange(i, 1)];
              tempStr = [NSMutableString stringWithFormat:@"%@%@",tempStr, currentCharacter];
              if ([closedScopeCharacters containsObject: currentCharacter])
              {
                  break;
              }
               
           }
       }

         NSMutableString *firstMarh = [tempStr copy];
                  while (!NSEqualRanges(march, NSMakeRange(NSNotFound, 0))) {
                    [tempStr deleteCharactersInRange:NSMakeRange([tempStr length]-1, 1)];
                    [tempStr deleteCharactersInRange:NSMakeRange(0, 1)];
                        
                    [result addObject: tempStr];
                    
                    if(![Parser isScopeCloused:tempStr]) {
                        
                        NSString *close = [Parser findCloseChar: tempStr];
                        NSRange tempRange = [copy rangeOfString: tempStr];
                        for (int i = tempRange.location + tempRange.length; i < [copy length]; i++) {
                           
                           NSString *currentCharacter = [string substringWithRange:NSMakeRange(i, 1)];
                           tempStr = [NSMutableString stringWithFormat:@"%@%@",tempStr, currentCharacter];
                           if ([close isEqualToString: currentCharacter])
                           {
                               break;
                           }
                            
                        }
                    }
                    march = [regex rangeOfFirstMatchInString: tempStr options:0 range:NSMakeRange(0, [tempStr length])];
                    if (!NSEqualRanges(march, NSMakeRange(NSNotFound, 0))) {
                          tempStr = [NSMutableString stringWithFormat:@"%@", [tempStr substringWithRange:march] ];
                      }
                }
                
                copy = [copy stringByReplacingOccurrencesOfString: firstMarh withString:@""];
                march = [regex rangeOfFirstMatchInString: copy options:0 range:NSMakeRange(0, [copy length])];
                
            }
            
            return result;
        }
        

+ (bool) isScopeCloused:(NSMutableString *) string
{
    NSArray *openScopeCharacters = @[@"[",@"<",@"("];
    int openScopeCharacterCount = 0;
    NSArray *closedScopeCharacters = @[@"]",@">",@")"];
    int closedScopeCharacterrCount = 0;
    
    for (int i = 0; i < [string length]; i++) {
        
        NSString *currentCharacter = [string substringWithRange:NSMakeRange(i, 1)];
        if ([openScopeCharacters containsObject: currentCharacter]) {
            openScopeCharacterCount += 1;
        }
        else if ([closedScopeCharacters containsObject: currentCharacter])
        {
            closedScopeCharacterrCount += 1;
        }
     }

    return openScopeCharacterCount == closedScopeCharacterrCount;
}


+ (NSString *) findCloseChar:(NSMutableString *) string
{
    NSArray *openScopeCharacters = @[@"[",@"<",@"("];
    NSArray *closedScopeCharacters = @[@"]",@">",@")"];
    NSString *res = @"";
    
    for (int i = 0; i < [string length]; i++) {
       
       NSString *currentCharacter = [string substringWithRange:NSMakeRange(i, 1)];
       if ([openScopeCharacters containsObject: currentCharacter]) {
           NSString *temp = [closedScopeCharacters objectAtIndex: [openScopeCharacters indexOfObject: currentCharacter]];
           res = [res stringByAppendingString: temp];
       }
       if ([closedScopeCharacters containsObject: currentCharacter] && [res containsString: currentCharacter])
       {
           res = [res stringByReplacingOccurrencesOfString: currentCharacter withString:@""];
       }
    }
    

    return res;
}



@end



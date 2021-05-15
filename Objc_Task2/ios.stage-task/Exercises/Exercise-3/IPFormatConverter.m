#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray<NSNumber *> *)numbersArray {
    
    if (!numbersArray || numbersArray.count == 0) {
        return @"";
    }
    
    NSMutableArray<NSString *> *addressComponents = [NSMutableArray new];
    NSUInteger length = 0;
    
    for (NSNumber *number in numbersArray) {
        if (length > 3) { break; }
        
        if (number.intValue < 0) {
            return @"Negative numbers are not valid for input.";
        }
        if (number.intValue > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        [addressComponents addObject:[NSString stringWithFormat:@"%@", number]];
        length++;
    }
    
    while(addressComponents.count < 4) {
        [addressComponents addObject:@"0"];
    }
    
    return [addressComponents componentsJoinedByString:@"."];
}

@end

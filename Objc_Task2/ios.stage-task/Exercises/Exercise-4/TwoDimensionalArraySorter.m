#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    if (!array || ![array.firstObject isKindOfClass:(NSArray.class)]) {
      return @[];
    }
    
    NSMutableArray<NSNumber *> *numbersArray = [NSMutableArray new];
    NSMutableArray<NSString *> *stringsArray = [NSMutableArray new];
    
    for (NSArray *innerArray in array) {
        if ([innerArray.firstObject isKindOfClass:NSNumber.class]) {
            for (NSNumber *number in innerArray) {
                [numbersArray addObject:number];
            }
        } else {
            for (NSString *string in innerArray) {
                [stringsArray addObject:string];
            }
        }
    }
    
    NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    NSSortDescriptor *descending = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    
    if (stringsArray.count == 0) {
        return [numbersArray sortedArrayUsingDescriptors:@[ascending]];
    }
    
    if (numbersArray.count == 0) {
        return [stringsArray sortedArrayUsingDescriptors:@[ascending]];
    }
    
    [numbersArray sortUsingDescriptors:@[ascending]];
    [stringsArray sortUsingDescriptors:@[descending]];
    
    return @[numbersArray, stringsArray];
}

@end

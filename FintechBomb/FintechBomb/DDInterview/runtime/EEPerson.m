//
//  EEPerson.m
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/18.
//

#import "EEPerson.h"
#import <objc/runtime.h>

@interface EEPerson()
@property (nonatomic, copy) NSString *aCopyString;
@property (nonatomic, strong) NSString *aStrongString;
@property (nonatomic, strong) NSMutableString *aMutableString;
@end

@implementation EEPerson

/// 测试可变字符串用copy修饰,会让类型变成NSString
- (void)testMutableStringCopy {
    NSString *a = @"abc";
    self.aMutableString = [NSMutableString stringWithString:a];
    NSLog(@"a = %p, self.aMutableString = %p", a, self.aMutableString);
    [self.aMutableString appendString:@"123"];
}

- (void)testCopyAndStringString {
    NSMutableString *mutableString = [NSMutableString stringWithString:@"abc"];
    self.aCopyString = mutableString;
    self.aStrongString = mutableString;
    NSLog(@"copyString: %@, %@, %p, %p", self.aCopyString, mutableString, self.aCopyString, mutableString);
    // 修改可变字符串
    [mutableString appendString:@"def"];
    NSLog(@"strongString: %@, %@, %p, %p", self.aStrongString, mutableString, self.aStrongString, mutableString);
}

- (void)printMethods {
    NSLog(@"person's name is %@", self.name);
    
    NSLog(@"EEPerson: test different Class's sel is same one: %p", @selector(printMethods));
    
//    id target = getTheReceiver();
    
    
//    [NSString copy];                // 浅拷贝
//    [NSString mutableCopy];         // 深拷贝
//    [NSMutableString copy];         // 深拷贝
//    [NSMutableString mutableCopy];  // 深拷贝
    
    
    NSString *a = @"aaaa";
    [a copy];
    [a mutableCopy];
    NSLog(@"a copy: %p, %p, %p", a, [a copy], [a mutableCopy]);
    
    NSMutableString *b = [NSMutableString stringWithString:@"bbbb"];
    [b copy];
    [b mutableCopy];
    NSLog(@"b copy: %p, %p, %p", b, [b copy], [b mutableCopy]);
    
    
    
    [NSArray copy];                // 浅拷贝
    [NSArray mutableCopy];         // 单层深拷贝(只拷贝了对象,对象的元素仍然是指针)
    [NSMutableArray copy];         // 单层深拷贝
    [NSMutableArray mutableCopy];  // 单层深拷贝
    
    NSArray *c = @[@"1", @"2", @"3"];
    [c copy];
    [c mutableCopy];
    NSLog(@"c copy: %p, %p, %p, %p, %p", c, [c copy], [c mutableCopy], [c copy][0], [c mutableCopy][0]);

    NSMutableArray *d = [NSMutableArray arrayWithArray:@[@"4", @"5", @"6"]];
    [d copy];
    [d mutableCopy];
    NSLog(@"d copy: %p, %p, %p, %p, %p", d, [d copy], [d mutableCopy], [d copy][1], [d mutableCopy][1]);
}

- (void)setName:(NSString *)name {
    _name = [name copy];
}

@end

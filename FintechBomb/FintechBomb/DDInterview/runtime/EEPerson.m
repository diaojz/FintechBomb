//
//  EEPerson.m
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/18.
//

#import "EEPerson.h"
#import <objc/runtime.h>

@implementation EEPerson

- (void)printMethods {
    NSLog(@"person's name is %@", self.name);
    
    NSLog(@"EEPerson: test different Class's sel is same one: %p", @selector(printMethods));
    
    id target = getTheReceiver();
    
}

@end

//
//  DDPerson.m
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/13.
//

#import "DDPerson.h"

@implementation DDPerson

- (void)printMethods {
    NSLog(@"person's name is %@", self.name);
    
    NSLog(@"DDPerson: test different Class's sel is same one: %p", @selector(printMethods));
}

@end

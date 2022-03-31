//
//  DDTestViewController.m
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/13.
//

#import "DDTestViewController.h"
#import "DDPerson.h"
#import "EEPerson.h"
#import "FintechBomb-Bridging-Header.h"
#import <objc/runtime.h>

@interface DDTestViewController ()

@property (nonatomic, copy) NSString *name;

@end

@implementation DDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
//    NSString *test = @"abc...";
//
//    id cls = [DDPerson class];
//    void *obj = &cls;
//    [(__bridge  id)obj printMethods];
    
    NSObject *obj = [[NSObject alloc] init];
    Class objClass = [obj class];
    Class objMata = [objClass class];
    
    NSLog(@"%@", objc_getClass([NSStringFromClass(objClass)UTF8String]));
    NSLog(@"%p", object_getClassName(obj));
    NSLog(@"%p", object_getClassName(objClass));
    NSLog(@"%p", object_getClassName(objMata));
    
//   // 会闪退
//    NSMutableArray *arr1 = [NSMutableArray array];
//    [arr1 addObject:nil];
//
//    // 这样的不会崩溃, nil会被过滤掉
//    NSMutableArray *arr2 = [[NSMutableArray alloc] initWithObjects:@"hello", @"world", nil, nil, nil];

    
//    self.name = @"";

    
    
    DDPerson *dPerson = [[DDPerson alloc] init];
    NSLog(@"person = %@", dPerson);
    [dPerson printMethods];
    
    EEPerson *ePerson = [[EEPerson alloc] init];
    NSLog(@"ePerson = %@", ePerson);
    [ePerson printMethods];
    
    
    // 测试 copy and strong
    [ePerson testCopyAndStringString];
    [ePerson testMutableStringCopy];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 200, 100, 50);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClicked:(UIButton *)btn {
    NSString *nilStr = nil;
    NSArray *array = @[@"nilhaha", nilStr, @"hahaha"];
    NSLog(@"array: %@", array);
}

@end


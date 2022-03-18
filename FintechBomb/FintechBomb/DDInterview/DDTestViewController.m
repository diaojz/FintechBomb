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
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

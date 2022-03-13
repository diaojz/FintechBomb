//
//  DDTestViewController.m
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/13.
//

#import "DDTestViewController.h"
#import "DDPerson.h"
#import "FintechBomb-Bridging-Header.h"
#import <objc/runtime.h>

@interface DDTestViewController ()

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

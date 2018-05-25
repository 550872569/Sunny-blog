//
//  ViewController.m
//  SunnyBlog
//
//  Created by Yan on 2018/5/24.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    BOOL res3 = [(id)[Person class] isKindOfClass:[Person class]];
    BOOL res4 = [(id)[Person class] isMemberOfClass:[Person class]];
    
    BOOL res5 = [(id)[Person new] isMemberOfClass:[Person class]];
    BOOL res6 = [(id)[Person new] isKindOfClass:[Person class]];
    
    BOOL res7 = [(id)[Teacher new] isMemberOfClass:[Person class]];
    BOOL res8 = [(id)[Teacher new] isKindOfClass:[Person class]];
    
    NSLog(@"\n res1:%d \n res2:%d \n res3:%d \n res4:%d \n res5:%d \n res6:%d \n res7:%d \n res8:%d \n",res1,res2,res3,res4,res5,res6,res7,res8);
}

@end

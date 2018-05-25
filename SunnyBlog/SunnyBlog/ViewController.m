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
#import "NSObject+DLIntrospection.h"

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
    /**
     res1:1
     res2:0
     res3:0
     res4:0
     res5:1
     res6:1
     res7:0
     res8:1

     */
    Teacher *t = [Teacher new];
    /**
     1. dealloc Teacher
     2. dealloc Person
     */
    

    /** 2018-05-25 13:29:01.399134+0800 SunnyBlog[3837:90097] dealloc:<Teacher: 0x60c00001a1c0>
     2018-05-25 13:29:03.019168+0800 SunnyBlog[3837:90097] dealloc:<Teacher: 0x60c00001a1c0> */
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
}

/** 验证KVO 是否创建一个子类 并在移除observer 之后移除该子类 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Person *t = [Person new];
   
    [t setName:@"sg"];
    /** <__NSSingleObjectArrayI 0x60800001e310>(
     NSString* _name
     )
     
     (lldb) po [[t class] instanceMethods]
     <__NSFrozenArrayM 0x60c000053800>(
     - (void).cxx_destruct,
     - (void)dealloc,
     - (id)name,
     - (void)willChangeValueForKey:(id)arg0 ,
     - (void)didChangeValueForKey:(id)arg0 ,
     - (void)setName:(id)arg0
     ) */
    NSLog(@"t:%@",t);
    return;
    Person *person = [Person new];
    /**
     (lldb) po object_getClassName(person)  "Person"
     */
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    #pragma mark  添加observer 之后创建一个新的子类 让原始类指向新类
    /**
     (lldb) po object_getClassName(person) "NSKVONotifying_Person"
      */
    [person setName:@"sogou"];
    
    [person removeObserver:self forKeyPath:@"name"];
#pragma mark  移除observer 之后移除创建的子类

    /**
     (lldb) po object_getClassName(person) "Person"
     
     */
}

@end

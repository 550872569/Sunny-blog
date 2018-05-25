//
//  Person.m
//  SunnyBlog
//
//  Created by sogou-Yan on 2018/5/25.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)willChangeValueForKey:(NSString *)key {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super willChangeValueForKey:key];
}

- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [super didChangeValueForKey:key];
}

- (void)dealloc {
    NSLog(@"dealloc:%@",self);
}
@end

//
//  RuntimeManager.m
//  runtime
//
//  Created by zengnaiu on 2019/1/14.
//  Copyright © 2019 zengnaiu. All rights reserved.
//

#import "RuntimeManager.h"
#import <objc/message.h>


@implementation RuntimeManager

const char *kPropertyListKey = "YFPropertyListKey";
static Class archiveModelClass;
static id archiveModel;


#pragma mark -- 获得方法、属性
+ (NSArray *)getAllMethodWithClass:(Class)className {
    NSMutableArray *methodNames = [NSMutableArray array];
    unsigned int count = 0;
    //获取所有方法
    Method *methodList = class_copyMethodList(className, &count);
    for (int i = 0; i < count; i++) {
        SEL  method = method_getName(methodList[i]);
        NSString *methodName = [NSString stringWithCString:sel_getName(method) encoding:NSUTF8StringEncoding];
        [methodNames addObject:methodName];
    }
    return methodNames.copy;
}


+ (NSArray *)getAllIvarWithClass:(Class )className {
    NSMutableArray *ivarNames = [NSMutableArray array];
    unsigned int count = 0;
    //获取所有方法
    Ivar *ivarList = class_copyIvarList(className, &count);
    for (int i = 0; i < count; i++) {
        Ivar var = ivarList[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(var) encoding:NSUTF8StringEncoding];
        [ivarNames addObject:ivarName];
    }
    return ivarNames.copy;
    
}



#pragma mark -- 添加方法
+ (BOOL)addMethodWithClass:(Class )className methodName:(NSString *)methodName IMPClass:(Class)impClassName impName:(NSString *)impName type:(NSString *)type {
    const char *methodType = [type UTF8String];
    BOOL isSuccess = class_addMethod(className, NSSelectorFromString(methodName), class_getMethodImplementation(impClassName, NSSelectorFromString(impName)), methodType);
    return isSuccess;
}
+ (BOOL)addMethodWithWithClass:(Class )className
                        methodSel:(SEL)methodSel
              implementationClass:(Class)implementationClass
                implementationSel:(SEL)implementationSel {
    
    BOOL isSuccess = class_addMethod(className, methodSel, class_getMethodImplementation(implementationClass, implementationSel), method_getTypeEncoding(class_getInstanceMethod(className, methodSel)));
    return isSuccess;
}



#pragma mark -- 交换两个方法
+ (void)exchangeMethodSourceClass:(Class)sourceClass
                           sourceSel:(SEL)sourceSel
                         targetClass:(Class)targetClass
                           targetSel:(SEL)targetSel{
    Method sourceM = class_getInstanceMethod(sourceClass, sourceSel);
    Method targetM  = class_getInstanceMethod(targetClass, targetSel);
    method_exchangeImplementations(sourceM, targetM);
}
#pragma mark -- 取代方法
+ (void)replaceMethodSourceClass:(Class)sourceClass
                          sourceSel:(SEL)sourceSel
                        targetClass:(Class)targetClass
                          targetSel:(SEL)targetSel {
    Method targetM  = class_getInstanceMethod(targetClass, targetSel);
    class_replaceMethod(sourceClass, sourceSel, method_getImplementation(targetM), method_getTypeEncoding(targetM));
}
#pragma mark -- 字典模型转换
+ (Class)modelWithDict:(NSDictionary *)dict
                    model:(Class)model {
    id objc = [[model alloc] init];
    
    NSArray *propertryList = [self getAllObjcProperties:model];
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([propertryList containsObject:key]) {
            [objc setValue:obj forKey:key];
        }
        
    }];
    return objc;
}
+ (NSArray *)getAllObjcProperties:(Class)model {
    //获取关联对象
    NSArray *ptyList = objc_getAssociatedObject(model, kPropertyListKey);
    if (ptyList) {//如果有值直接返回
        return ptyList;
    }
    unsigned int outCount = 0;
    objc_property_t *propertyList = class_copyPropertyList(model, &outCount);
    NSMutableArray *mtArray = [NSMutableArray array];
    for (int i = 0; i < outCount ; i ++) {
        
        objc_property_t property = propertyList[i];
        NSString *propertyName = [NSString stringWithCString: property_getName(property) encoding:NSUTF8StringEncoding];
        [mtArray addObject:propertyName];
    }
    //设置关联对象
    objc_setAssociatedObject(model, kPropertyListKey, mtArray.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    free(propertyList);
    return mtArray;
}
#pragma mark -- 归档解档
+ (BOOL)archive:(Class)modelClass
             model:(id)model
          filePath:(NSString *)path {
    [[self alloc] archiveAndUnarchive:modelClass model:model];
    BOOL result = [NSKeyedArchiver archiveRootObject:model toFile:path];
    if (result) {
        return YES;
    }
    return NO;
}
+ (id)unarchive:(Class)modelClass
          filePath:(NSString *)path {
    [[self alloc] archiveAndUnarchive:modelClass model:nil];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}
- (void)archiveAndUnarchive:(Class)modelClass model:(id)model {
    archiveModelClass = modelClass;
    archiveModel = model;
    [RuntimeManager replaceMethodSourceClass:modelClass sourceSel:@selector(initWithCoder:) targetClass:[RuntimeManager class] targetSel:@selector(initWithCoder:)];
    [RuntimeManager replaceMethodSourceClass:modelClass sourceSel:@selector(encodeWithCoder:) targetClass:[RuntimeManager class] targetSel:@selector(encodeWithCoder:)];
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    
    archiveModel = [super init];
    if (archiveModel) {
        NSArray *ivarNames = [RuntimeManager getAllIvarWithClass:archiveModelClass];
        for (NSString * key  in ivarNames) {
            id value = [coder decodeObjectForKey:key];
            [archiveModel setValue:value forKey:key];
        }
    }
    return archiveModel;
}

- (void)encodeWithCoder:(NSCoder *)coder{
    NSArray *ivarNames = [RuntimeManager getAllIvarWithClass:archiveModelClass];
    for (NSString *key in ivarNames) {
        id value = [archiveModel valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
    
}

@end

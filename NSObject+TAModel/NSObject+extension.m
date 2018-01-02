//
//  NSObject+extension.m
//  字典转模型
//
//  Created by tasama on 16/7/31.
//  Copyright © 2016年 tasama. All rights reserved.
//

#import "NSObject+extension.h"

#import <objc/runtime.h>

@implementation NSObject (extension)

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [self init]) {
        Class c = self.class;
        while (c && c != [NSObject class]) {
            unsigned int count = 0;
            Ivar *vars = class_copyIvarList(c, &count);
            
            for (int i = 0; i < count; i++) {
                Ivar var = vars[i];
                
                NSString *varString = [NSString stringWithUTF8String:ivar_getName(var)];
                NSString *propertyName = [varString substringFromIndex:1];
                
                if (!dict[propertyName]) {
                    continue;
                }
                id value = dict[propertyName];
                NSString *varType = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];
                
                NSLog(@"%@",varType);
                if ([varType containsString:@"@"]) {
                    NSString *type = [varType substringWithRange:NSMakeRange(2, varType.length - 3)];
                    
                    if (!([type hasPrefix:@"NS"] || [type hasPrefix:@"__"] || [type hasPrefix:@"AV"] || [varType hasPrefix:@"UITouchesEvent"] || [type hasPrefix:@"_UIFlowLayout"])) {
                        
                        Class objc = NSClassFromString(type);
                        value = [[objc alloc]initWithDict:value];
                    }
                    NSLog(@"%@",type);
                    if ([type isEqualToString:@"NSArray"]) {
                        
                        if ([self respondsToSelector:@selector(arrayClass)]) {
                            NSMutableArray *temArr = [NSMutableArray array];
                            
                            [value enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                
                                if ([obj isKindOfClass:[NSDictionary class]]) {
                                    
                                    obj = (NSDictionary *)obj;
                                    
                                    NSDictionary *modelNameDic = [self arrayClass];
                                    
                                    NSString *modelString = modelNameDic[propertyName];
                                    Class modelClass = NSClassFromString(modelString);
                                    
                                    id model = [[modelClass alloc]initWithDict:obj];
                                    
                                    [temArr addObject:model];
                                }
                            }];
                            
                            value = temArr.copy;
                        }
                    }
                }
                
                [self setValue:value forKeyPath:propertyName];
            }
            c = [self superclass];
        }
    }
    return self;
}

+ (NSArray *)initWithArray:(NSArray<NSDictionary *> *)dicts {
    
    NSMutableArray *tempArray = @[].mutableCopy;
    for (NSDictionary *dict in dicts) {
        
        id model = [[self alloc] initWithDict:dict];
        [tempArray addObject:model];
    }
    return tempArray.count > 0 ? tempArray.copy : nil;
}


@end

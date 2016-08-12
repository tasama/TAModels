//
//  NSObject+extension.h
//  字典转模型
//
//  Created by tasama on 16/7/31.
//  Copyright © 2016年 tasama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (extension)

- (instancetype)initWithDict:(NSDictionary *)dict;

- (NSDictionary *)arrayClass;

@end

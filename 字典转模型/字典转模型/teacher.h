//
//  teacher.h
//  字典转模型
//
//  Created by tasama on 16/7/31.
//  Copyright © 2016年 tasama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "model.h"

@interface teacher : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) model *mo;

@property (nonatomic, assign) int age;

@property (nonatomic, strong) NSArray *models;

@property (nonatomic, strong) NSArray *persons;


@end

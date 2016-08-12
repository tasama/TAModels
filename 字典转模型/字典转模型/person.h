//
//  person.h
//  字典转模型
//
//  Created by tasama on 16/7/31.
//  Copyright © 2016年 tasama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "model.h"

@interface person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat score;
@property (nonatomic, strong) model *mo;


@end

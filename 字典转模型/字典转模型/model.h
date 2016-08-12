//
//  model.h
//  字典转模型
//
//  Created by tasama on 16/7/31.
//  Copyright © 2016年 tasama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface model : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) CGFloat weight;
@property (nonatomic, assign) BOOL student;

@end

//
//  ViewController.m
//  字典转模型
//
//  Created by tasama on 16/7/31.
//  Copyright © 2016年 tasama. All rights reserved.
//

#import "ViewController.h"
#import "model.h"
#import "NSObject+extension.h"
#import "person.h"
#import "teacher.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)btnClicked {
    
    NSDictionary *dict = @{
                           @"name": @"小明",
                           @"age": @10,
                           @"weight": @117.5,
                           @"gender": @"男",
                           @"height": @180.8,
                           @"score": @120,
                           @"mo": @{
                                   @"name": @"小松",
                                   @"age": @20,
                                   @"weight": @172.65
                                   },
                           @"models": @[
                                        @{
                                            @"name":@"ffs",
                                            @"age":@21,
                                            @"weight":@108,
                                            @"student":@YES
                                          },
                                        @{
                                            @"name":@"afa",
                                            @"age":@18,
                                            @"weight":@120,
                                            @"student":@NO
                                            }
                                        ],
                           @"persons": @[
                                   @{
                                       @"name":@"dasdasd",
                                       @"age" :@21,
                                       @"height":@164,
                                       @"score":@94,
                                       @"mo": @{}
                                       },
                                   @{
                                       @"name":@"dssdasd",
                                       @"age" :@29,
                                       @"height":@172,
                                       @"score":@104,
                                       @"mo": @{}
                                       }
                                        ]
                           };
    
    teacher *pe = [[teacher alloc]initWithDict:dict];
    
    
    NSLog(@" ----- %@",pe);
}

@end

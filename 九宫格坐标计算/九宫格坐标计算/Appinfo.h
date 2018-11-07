//
//  Appinfo.h
//  九宫格坐标计算
//
//  Created by withcoco on 2018/11/4.
//  Copyright © 2018 withcoco. All rights reserved.
//
#import "UIkit/UIkit.h"
#import <Foundation/Foundation.h>

@interface Appinfo : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong,readonly)UIImage *image;
//instancetype会让编译器检查实例化对象的准确类型
//instancetype只能用于返回类型，不能当作参数使用
- (instancetype)initWithDict:(NSDictionary *)dict;
//工厂方法
+ (instancetype)appInfoWithDict:(NSDictionary *)dict;
@end

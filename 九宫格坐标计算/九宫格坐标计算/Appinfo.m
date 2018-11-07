//
//  Appinfo.m
//  九宫格坐标计算
//
//  Created by withcoco on 2018/11/4.
//  Copyright © 2018 withcoco. All rights reserved.
//

#import "Appinfo.h"
@interface Appinfo()
{
    UIImage *_imageABC;
}
@end
@implementation Appinfo
- (instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self){
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}
+ (instancetype)appInfoWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
- (UIImage *)image{
    if (!_imageABC){
        _imageABC = [UIImage imageNamed:self.icon];
    }
    return  _imageABC;
}
@end

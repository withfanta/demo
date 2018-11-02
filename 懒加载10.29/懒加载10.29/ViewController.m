//
//  ViewController.m
//  懒加载10.29
//
//  Created by withcoco on 2018/10/29.
//  Copyright © 2018 withcoco. All rights reserved.
//

#import "ViewController.h"
#define PW    200
#define PH    300
#define PX    60
#define PY    50
@interface ViewController ()
@property (nonatomic,strong)UILabel *firstlab;
@property (nonatomic,strong)UILabel *lastlab;
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UIButton *leftbtn;
@property (nonatomic,strong)UIButton *rightbtn;
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,assign)int i;
- (void)change;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self change];
}
- (void)change{
    [self.firstlab setText:[NSString stringWithFormat:@"%d/5",self.i+1]];
    self.icon.image = [UIImage imageNamed:self.array[self.i][@"name"]];
    self.lastlab.text = self.array[self.i][@"desc"];
    self.leftbtn.enabled = (self.i!=0);
    self.rightbtn.enabled = (self.i!=4);
}
//图片的序号label加载
- (UILabel *)firstlab{
    if (!_firstlab){
        _firstlab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 30)];
        [_firstlab setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:_firstlab];
    }
    return _firstlab;
}
//左键按钮的加载
- (UIButton *)leftbtn{
    if (!_leftbtn){
        _leftbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.center.y, 40, 40)];
        [_leftbtn setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
        [_leftbtn setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateHighlighted];
        [self.view addSubview:_leftbtn];
        [_leftbtn addTarget:self action:@selector(leftclick:) forControlEvents:UIControlEventTouchUpInside];
    }
        return _leftbtn;
}
//右键按钮的加载
- (UIButton *)rightbtn{
    if (!_rightbtn){
        _rightbtn = [[UIButton alloc]initWithFrame:CGRectMake(PX+PW+10, self.view.center.y, 40, 40)];
        [_rightbtn setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
        [_rightbtn setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateHighlighted];
        [self.view addSubview:_rightbtn];
        [_rightbtn addTarget:self action:@selector(rightclick:) forControlEvents:UIControlEventTouchUpInside];
    }
        return _rightbtn;
}
//图片控件的加载
- (UIImageView *)icon{
    if (!_icon){
        _icon = [[UIImageView alloc]initWithFrame:CGRectMake(PX, PY, PW, PH)];
        UIImage *image = [UIImage imageNamed:@"rongshanlong1"];
        _icon.image = image;
        [self.view addSubview:_icon];
    }
    return _icon;
}//描述控件label的加载
- (UILabel *)lastlab{
    if (!_lastlab){
        _lastlab = [[UILabel alloc]initWithFrame:CGRectMake(200, 400, 300, 30)];
        [_lastlab setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:_lastlab];
    }
    return _lastlab;
}
- (void)rightclick:(UIButton *)btn{
    self.i++;
    [self change];
}
- (void)leftclick:(UIButton *)btn{
    self.i++;
    [self change];
}
//array的get方法
- (NSArray *)array{
    if (_array==nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        _array = [[NSArray alloc]initWithContentsOfFile:path];
    }
    return _array;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

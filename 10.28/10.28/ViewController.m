//
//  ViewController.m
//  10.28
//
//  Created by withcoco on 2018/10/28.
//  Copyright © 2018 withcoco. All rights reserved.
//

#import "ViewController.h"
#define PW 200
#define PH 300
#define PX 60
#define PY 50
@interface ViewController ()
@property (nonatomic,strong)UILabel *firstlab;
@property (nonatomic,strong)UILabel *lastlab;
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UIButton *leftbtn;
@property (nonatomic,strong)UIButton *rightbtn;
- (void)change;
@property (nonatomic,assign)int i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.i = 0;
    //创建一个label控件用来显示序号
    UILabel *headlab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 300, 30)];
    [headlab setTextAlignment:NSTextAlignmentCenter];
    [headlab setTextColor:[UIColor blackColor]];
    [self.view addSubview:headlab];
    self.firstlab = headlab;
    //创建一个控件用来装载图片
    UIImageView *PI = [[UIImageView alloc]initWithFrame:CGRectMake(PX, PY, PW, PH)];
    UIImage *image = [UIImage imageNamed:@"rongshanlong1"];
    PI.image = image;
    [self.view addSubview:PI];
    self.icon = PI;
    //创建下面的语言描述label
    UILabel *des = [[UILabel alloc]initWithFrame:CGRectMake(20, 400, 300, 30)];
    [des setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:des];
    self.lastlab = des;
    //创建两个方向键按钮
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(0, self.view.center.y, 40, 40);
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateHighlighted];
    [self.view addSubview:leftbtn];
    self.leftbtn = leftbtn;
    [leftbtn addTarget:self action:@selector(leftclick:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(PX+PW+10, self.view.center.y, 40, 40);
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateHighlighted];
    [self.view addSubview:rightbtn];
    self.rightbtn = rightbtn;
    [rightbtn addTarget:self action:@selector(rightclick:) forControlEvents:UIControlEventTouchUpInside];
    //这是一个初始化方法
    [self change];
}
- (void)change{
    [self.firstlab setText:[NSString stringWithFormat:@"%d/5",self.i+1]];
    switch (self.i) {
        case 0:
            self.lastlab.text=@"熔山龙";
            self.icon.image = [UIImage imageNamed:@"rongshanlong1"];
            break;
        case 1:
            self.lastlab.text=@"冥灯龙";
            self.icon.image = [UIImage imageNamed:@"mingdenglong1"];
            break;
        case 2:
            self.lastlab.text=@"钢龙";
            self.icon.image = [UIImage imageNamed:@"ganglong1"];
            break;
        case 3:
            self.lastlab.text=@"尸套龙";
            self.icon.image = [UIImage imageNamed:@"shitaolong1"];
            break;
        case 4:
            self.lastlab.text=@"炎王龙";
            self.icon.image = [UIImage imageNamed:@"yanwanglong1"];
            break;
    }
    self.leftbtn.enabled = (self.i!=0);
    self.rightbtn.enabled = (self.i!=4);
}
//向右左按键
- (void)rightclick:(UIButton *)btn{
    self.i++;
    [self change];
}
- (void)leftclick:(UIButton *)btn{
    self.i--;
    [self change];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

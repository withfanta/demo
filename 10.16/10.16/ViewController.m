//
//  ViewController.m
//  10.16
//
//  Created by withcoco on 2018/10/16.
//  Copyright © 2018 withcoco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>
@property (strong,nonatomic)UIButton *btnview;
@end
typedef enum {
    upbtntag = 1,
    downbtntag
}btntag;
@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *headbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headbtn.frame = CGRectMake(100, 100, 100, 100);
    [headbtn setBackgroundImage:[UIImage imageNamed:@"yongzhe1"] forState:UIControlStateNormal];
    [headbtn setTitle:@"勇者" forState:UIControlStateNormal];
    [headbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [headbtn setBackgroundImage:[UIImage imageNamed:@"yongzhe2"] forState:UIControlStateHighlighted];
    [headbtn setTitle:@"其实是魔王" forState:UIControlStateHighlighted];
    [headbtn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [self.view addSubview:headbtn];
    self.btnview = headbtn;
    //向上的按钮
    UIButton *upbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    upbtn.frame = CGRectMake(100, 250, 40, 40);
    [upbtn setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [upbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [upbtn setTag:1];
    [self.view addSubview:upbtn];
    [upbtn addTarget:nil action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    //向下的按钮
    UIButton *downbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    downbtn.frame = CGRectMake(100, 350, 40, 40);
    [downbtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [downbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [downbtn setTag:2];
    [self.view addSubview:downbtn];
    [downbtn addTarget:nil action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    //向左的按钮
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = CGRectMake(50, 300, 40, 40);
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [leftbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [leftbtn setTag:4];
    [self.view addSubview:leftbtn];
    [leftbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    //向右的按钮
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightbtn.frame = CGRectMake(150, 300, 40, 40);
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [rightbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [rightbtn setTag:3];
    [self.view addSubview:rightbtn];
    [rightbtn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    //放大的按钮
    UIButton *plusbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    plusbtn.frame = CGRectMake(75, 400, 40, 40);
    [plusbtn setBackgroundImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
    [plusbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [self.view addSubview:plusbtn];
    [plusbtn setTag:1];
    [plusbtn addTarget:self action:@selector(Zoom:) forControlEvents:UIControlEventTouchUpInside];
    //缩小的按钮
    UIButton *minusbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    minusbtn.frame = CGRectMake(125, 400, 40, 40);
    [minusbtn setBackgroundImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
    [minusbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [self.view addSubview:minusbtn];
    [minusbtn setTag:0];
    [minusbtn addTarget:self action:@selector(Zoom:) forControlEvents:UIControlEventTouchUpInside];
    //向左旋转按钮
    UIButton *leftrbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftrbtn.frame = CGRectMake(175, 400, 40, 40);
    [leftrbtn setBackgroundImage:[UIImage imageNamed:@"leftr"] forState:UIControlStateNormal];
    [leftrbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [leftrbtn setTag:1];
    [self.view addSubview:leftrbtn];
    [leftrbtn addTarget:self action:@selector(R:) forControlEvents:UIControlEventTouchUpInside];
    //向右旋转按钮
    UIButton *rightrbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightrbtn setFrame:CGRectMake(225, 400, 40, 40)];
    [rightrbtn setBackgroundImage:[UIImage imageNamed:@"rightr"] forState:UIControlStateNormal];
    [rightrbtn setBackgroundImage:[UIImage imageNamed:@"i"] forState:UIControlStateHighlighted];
    [rightrbtn setTag:0];
    [self.view addSubview:rightrbtn];
    [rightrbtn addTarget:self action:@selector(R:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)Click:(UIButton *)button{
    CGPoint center = self.btnview.center;
    switch (button.tag) {
        case 1:
            center.y-=30;
            break;
        case 2:
            center.y+=30;
            break;
        case 3:
            center.x+=50;
            break;
        case 4:
            center.x-=50;
            break;
        default:
            break;
    }
    [UIView beginAnimations:nil context:nil];
    self.btnview.center=center;
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
    NSLog(@"移动！");
}
- (void)Zoom:(UIButton *)btn{
    CGRect bounds = self.btnview.bounds;
    if (btn.tag){
        bounds.size.height+=30;
        bounds.size.width+=30;
    }else{
        bounds.size.height-=50;
        bounds.size.width-=50;
    }
    [UIView beginAnimations:nil context:nil];
    self.btnview.bounds=bounds;
    [UIView setAnimationDuration:2.0];
    [UIView commitAnimations];
}
- (void)R:(UIButton *)r{
    if (r.tag){
        self.btnview.transform = CGAffineTransformRotate(self.btnview.transform, -M_1_PI);
    }else{
        self.btnview.transform = CGAffineTransformRotate(self.btnview.transform, M_1_PI);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

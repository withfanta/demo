//
//  ViewController.m
//  九宫格坐标计算
//
//  Created by withcoco on 2018/11/2.
//  Copyright © 2018 withcoco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)NSArray *apps;
@end

@implementation ViewController
- (NSArray *)apps{
    //1.从mainBundle加载
    if (!_apps){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%d",self.apps.count);
    //布局设计
    //三列
    int totalloc = 3;
    CGFloat appvieww = 80;
    CGFloat appviewh = 90;
    CGFloat margin = (self.view.frame.size.width-totalloc*appvieww)/(totalloc+1);
    int count = self.apps.count;
    for (int i; i<count; i++){
        int row = i/totalloc;
        int loc = i%totalloc;
        CGFloat appviewx = margin+(margin+appvieww)*loc;
        CGFloat appviewy = margin+(margin+appviewh)*row;
        //创建uiview控件
        UIView *appview = [[UIView alloc]initWithFrame:CGRectMake(appviewx, appviewy, appvieww, appviewh)];
        [self.view addSubview:appview];
        //创建uiview中的子视图
        UIImageView *appimageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
        UIImage *appimage = [UIImage imageNamed:self.apps[i][@"icon"]];
        appimageview.image = appimage;
        [appimageview setContentMode:UIViewContentModeScaleAspectFit];
        [appview addSubview:appimageview];
        //创建文本标签
        UILabel *applabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 80, 20)];
        [applabel setText:self.apps[i][@"name"]];
        [applabel setTextAlignment:NSTextAlignmentCenter];
        [applabel setFont:[UIFont systemFontOfSize:12.0]];
        [appview addSubview:applabel];
        //创建按钮
        UIButton *appbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        appbtn.frame = CGRectMake(10, 70, 60, 20);
        [appbtn setBackgroundImage:[UIImage imageNamed:@"green"] forState:UIControlStateNormal];
        [appbtn setBackgroundImage:[UIImage imageNamed:@"gr"] forState:UIControlStateHighlighted];
        [appbtn setTitle:@"下载" forState:UIControlStateNormal];
        appbtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [appview addSubview:appbtn];
        [appbtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)click{
    UILabel *applabel2 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.center.x-100, self.view.center.y+20, 200, 40)];
    [applabel2 setText:@"下载成功！"];
    applabel2.font = [UIFont systemFontOfSize:12.0];
    [applabel2 setBackgroundColor:[UIColor brownColor]];
    [applabel2 setAlpha:0];
    [self.view addSubview:applabel2];
    [UIView animateWithDuration:4.0 animations:^{
        [applabel2 setAlpha:1];
    }completion:^(BOOL finished){
        [applabel2 setAlpha:0];
    }
     ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

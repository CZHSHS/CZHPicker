//
//  ViewController.m
//  CZHPickerView
//
//  Created by 熠耀星空 on 2019/3/27.
//  Copyright © 2019年 CZH. All rights reserved.
//

#import "ViewController.h"
#import "CZHPiceker.h"
@interface ViewController ()<CZHPickerDelegate>
@property(nonatomic,strong)CZHPiceker * pick_view;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.pick_view = [[CZHPiceker alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame), self.view.frame.size.width, self.view.frame.size.height)];
    self.pick_view.delegate = self;
    [self.view addSubview:self.pick_view];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.pick_view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
-(void)hidenView{
    [UIView animateWithDuration:0.3 animations:^{
        self.pick_view.frame = CGRectMake(0, CGRectGetMaxY(self.view.frame), self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished) {
        [self.pick_view removeFromSuperview];
    }];
    
}
-(void)selectBigType:(NSString *)bigType type:(NSString *)type{
    NSLog(@"%@   %@",bigType,type);
}

@end

//
//  CZHPiceker.m
//  CZHPickerView
//
//  Created by 熠耀星空 on 2019/3/27.
//  Copyright © 2019年 CZH. All rights reserved.
//

#import "CZHPiceker.h"

@interface CZHPiceker ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic,strong)UIPickerView * pickerView;
@property(nonatomic,strong)NSArray * bigType_arr;
@property(nonatomic,strong)NSArray * type_arr;
@property(nonatomic,strong)UIView * back_view;
@property(nonatomic,copy)NSString * select_bigType;
@property(nonatomic,copy)NSString * select_type;
@end

@implementation CZHPiceker
{
    NSInteger currentRow;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.bigType_arr = @[@"北京",@"廊坊",@"天津",@"上海"];
        self.type_arr =@[
                          @[@"朝阳区",@"海淀区",@"昌平区"],
                          @[@"大厂县",@"香河县",@"三河市",@"固安县",@"霸州县"],
                          @[@"西青区",@"河北区",@"蓟县"],
                          @[@"黄埔区",@"卢湾区",@"徐汇区",@"长宁区"]
                          ];
        currentRow = 0;
        self.select_bigType = self.bigType_arr[0];
        self.select_type = self.type_arr[0][0];
        [self addSubview:self.back_view];
        [self.back_view addSubview:self.cancle_but];
        [self.back_view addSubview:self.done_but];
        [self.back_view addSubview:self.pickerView];
    }
    return self;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.bigType_arr.count;
    }
    return [self.type_arr[currentRow]count];
}
#pragma mark - 反回pickerView的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 100.f;
}
#pragma mark -返回pickerView的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30.f;
}
#pragma mark -返回pickerView 每行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.bigType_arr[row];
    }
    return self.type_arr[currentRow][row];
}
#pragma mark -选中行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        currentRow = row;
        
        [self.pickerView reloadComponent:1];
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
        self.select_bigType = self.bigType_arr[currentRow];
        self.select_type = self.type_arr[currentRow][0];
    }else{
        self.select_bigType = self.bigType_arr[currentRow];
        self.select_type = self.type_arr[currentRow][row];
    }
    
}
-(void)cancle_butClicked{
    if ([self.delegate respondsToSelector:@selector(hidenView)]) {
        [self.delegate hidenView];
    }
}
-(void)done_butClicked{
    if ([self.delegate respondsToSelector:@selector(selectBigType:type:)]) {
        [self.delegate selectBigType:self.select_bigType type:self.select_type];
    }
}
-(UIButton *)cancle_but{
    if (!_cancle_but) {
        _cancle_but = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
        [_cancle_but setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_cancle_but setTitle:@"Cancle" forState:UIControlStateNormal];
        [_cancle_but addTarget:self action:@selector(cancle_butClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancle_but;
}
-(UIButton *)done_but{
    if (!_done_but) {
        _done_but = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.back_view.frame)-70, 0, 70, 40)];
        [_done_but setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_done_but setTitle:@"Done" forState:UIControlStateNormal];
        [_done_but addTarget:self action:@selector(done_butClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _done_but;
}
-(UIPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.done_but.frame), self.frame.size.width, 150)];
        _pickerView.delegate = self;
        _pickerView.dataSource = self;
    }
    return _pickerView;
}
-(UIView *)back_view{
    if (!_back_view) {
        _back_view = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 190, self.frame.size.width, 190)];
        _back_view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    }
    return _back_view;
}
@end

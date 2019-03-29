//
//  CZHPiceker.h
//  CZHPickerView
//
//  Created by 熠耀星空 on 2019/3/27.
//  Copyright © 2019年 CZH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CZHPickerDelegate <NSObject>
-(void)selectBigType:(NSString *)bigType type:(NSString *)type;
-(void)hidenView;

@end

@interface CZHPiceker : UIView
@property(nonatomic,strong)UIButton * cancle_but;
@property(nonatomic,strong)UIButton * done_but;
@property(nonatomic,weak)id<CZHPickerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

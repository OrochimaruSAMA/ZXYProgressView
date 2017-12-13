//
//  ZXYGradientProgress.h
//  ProgressView
//
//  Created by Mars on 2017/12/12.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXYGradientProgress : UIView

/** 进度 */
@property (nonatomic, assign) CGFloat progress;
/** 底层颜色 */
@property (nonatomic, strong) UIColor *bottomColor;


/** 初始化 */
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress;

@end

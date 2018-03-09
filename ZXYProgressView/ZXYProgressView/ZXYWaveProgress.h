//
//  ZXYWaveProgress.h
//  ZXYProgressView
//
//  Created by Mars on 2017/11/28.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXYWaveProgress : UIView

/** 进度 */
@property (nonatomic, assign) CGFloat progress;
/** 填充颜色 */
@property (nonatomic, strong) UIColor *fillColor;
/** 边框颜色 */
@property (nonatomic, strong) UIColor *strokeColor;


/** 初始化 */
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress;

@end

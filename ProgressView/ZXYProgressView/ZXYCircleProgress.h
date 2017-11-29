//
//  ZXYCircleProgress.h
//  ZXYProgressView
//
//  Created by Mars on 2017/11/28.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXYCircleProgress : UIView

/** 进度 */
@property (nonatomic, assign) CGFloat progress;
/** 底层颜色 */
@property (nonatomic, strong) UIColor *bottomColor;
/** 底层宽度 */
@property (nonatomic, assign) CGFloat bottomWidth;
/** 顶层颜色 */
@property (nonatomic, strong) UIColor *topColor;
/** 顶层宽度 */
@property (nonatomic, assign) CGFloat topWidth;


/** 初始化 */
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress;

@end

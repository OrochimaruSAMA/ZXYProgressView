//
//  ZXYSectorProgress.h
//  ZXYProgressView
//
//  Created by Mars on 2017/11/27.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXYSectorProgress : UIView

/** 进度 */
@property (nonatomic, assign) CGFloat progress;
/** 填充颜色 */
@property (nonatomic, strong) UIColor *fillColor;

/** 初始化 */
- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress;

@end

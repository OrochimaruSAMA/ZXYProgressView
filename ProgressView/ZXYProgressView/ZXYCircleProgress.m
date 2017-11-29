//
//  ZXYCircleProgress.m
//  ZXYProgressView
//
//  Created by Mars on 2017/11/28.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import "ZXYCircleProgress.h"

@interface ZXYCircleProgress ()
{
    /** 原点 */
    CGPoint _origin;
    /** 半径 */
    CGFloat _radius;
    /** 起始 */
    CGFloat _startAngle;
    /** 结束 */
    CGFloat _endAngle;
}

/** 进度显示 */
@property (nonatomic, strong) UILabel *progressLabel;
/** 底层显示层 */
@property (nonatomic, strong) CAShapeLayer *bottomLayer;
/** 顶层显示层 */
@property (nonatomic, strong) CAShapeLayer *topLayer;

@end

@implementation ZXYCircleProgress

- (instancetype)initWithFrame:(CGRect)frame progress:(CGFloat)progress {
    if (self) {
        self = [super initWithFrame:frame];
        self.backgroundColor = [UIColor clearColor];
        [self setUI];
        self.progress = progress;
    }
    return self;
}

#pragma mark - 初始化页面
- (void)setUI {
    
    [self.layer addSublayer:self.bottomLayer];
    [self.layer addSublayer:self.topLayer];
    [self addSubview:self.progressLabel];
    
    _origin = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    _radius = self.bounds.size.width / 2;
    
    UIBezierPath *bottomPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    _bottomLayer.path = bottomPath.CGPath;
    _bottomLayer.fillColor = [UIColor clearColor].CGColor;
    
    _topLayer.lineCap = kCALineCapRound;
    _topLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = bottomPath.CGPath;
    self.layer.mask = maskLayer;
    
}

#pragma mark --- 懒加载progressLabel
- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 15)];
        _progressLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor blackColor];
    }
    return _progressLabel;
}

#pragma mark --- 懒加载bottomLayer
- (CAShapeLayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [CAShapeLayer layer];
    }
    return _bottomLayer;
}

#pragma mark --- 懒加载topLayer
- (CAShapeLayer *)topLayer {
    if (!_topLayer) {
        _topLayer = [CAShapeLayer layer];
    }
    return _topLayer;
}

#pragma mark - setMethod
#pragma mark --- 进度progress
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    _progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    
    _startAngle = - M_PI_2;
    _endAngle = _startAngle + _progress * M_PI * 2;
    
    UIBezierPath *topPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius - _topWidth startAngle:_startAngle endAngle:_endAngle clockwise:YES];
    _topLayer.path = topPath.CGPath;
}

#pragma mark --- 底层颜色bottomColor
- (void)setBottomColor:(UIColor *)bottomColor {
    _bottomColor = bottomColor;
    _bottomLayer.strokeColor = _bottomColor.CGColor;
}

#pragma mark --- 底层宽度bottomWidth
- (void)setBottomWidth:(CGFloat)bottomWidth {
    _bottomWidth = bottomWidth;
    _bottomLayer.lineWidth = _bottomWidth;
}

#pragma mark --- 顶层颜色topColor
- (void)setTopColor:(UIColor *)topColor {
    _topColor = topColor;
    _topLayer.strokeColor = _topColor.CGColor;
}

#pragma mark --- 顶层宽度topWidth
- (void)setTopWidth:(CGFloat)topWidth {
    _topWidth = topWidth;
    _topLayer.lineWidth = _topWidth;
    
    UIBezierPath *topPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius - _topWidth startAngle:_startAngle endAngle:_endAngle clockwise:YES];
    _topLayer.path = topPath.CGPath;
}

@end

//
//  ZXYBallProgress.m
//  ZXYProgressView
//
//  Created by Mars on 2017/11/27.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import "ZXYBallProgress.h"

@interface ZXYBallProgress ()
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
/** 填充layer */
@property (nonatomic, strong) CAShapeLayer *fillLayer;
/** 边框layer */
@property (nonatomic, strong) CAShapeLayer *strokeLayer;

@end

@implementation ZXYBallProgress

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
    
    [self.layer addSublayer:self.fillLayer];
    [self.layer addSublayer:self.strokeLayer];
    [self addSubview:self.progressLabel];
    
    _origin = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    _radius = self.bounds.size.width / 2;
    
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    _strokeLayer.path = borderPath.CGPath;
    _strokeLayer.strokeColor = _strokeColor.CGColor;
    _strokeLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = borderPath.CGPath;
    self.layer.mask = maskLayer;
}

#pragma mark - 懒加载
- (UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 15)];
        _progressLabel.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        _progressLabel.textColor = [UIColor blackColor];
    }
    return _progressLabel;
}

- (CAShapeLayer *)fillLayer {
    if (!_fillLayer) {
        _fillLayer = [CAShapeLayer layer];
    }
    return _fillLayer;
}

- (CAShapeLayer *)strokeLayer {
    if (!_strokeLayer) {
        _strokeLayer = [CAShapeLayer layer];
    }
    return _strokeLayer;
}

#pragma mark - setMethod
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    _progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    
    _startAngle = M_PI_2 - _progress * M_PI;
    _endAngle = M_PI_2 + _progress * M_PI;
    
    UIBezierPath *fillPath = [UIBezierPath bezierPathWithArcCenter:_origin radius:_radius startAngle:_startAngle endAngle:_endAngle clockwise:YES];
    _fillLayer.path = fillPath.CGPath;
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    _fillLayer.fillColor = _fillColor.CGColor;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    _strokeLayer.strokeColor = _strokeColor.CGColor;
}

@end


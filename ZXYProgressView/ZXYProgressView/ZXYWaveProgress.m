//
//  ZXYWaveProgress.m
//  ZXYProgressView
//
//  Created by Mars on 2017/11/28.
//  Copyright © 2017年 赵向禹. All rights reserved.
//

#import "ZXYWaveProgress.h"

@interface ZXYWaveProgress ()
{
    /** 决定峰值 A */
    CGFloat _waveA;
    /** 角速度 */
    CGFloat _waveP;
    /** 决定周期 ω */
    CGFloat _waveW;
    /** 初相位 φ (x轴移动距离) */
    CGFloat _waveX;
    /** 波浪高度 k (y轴移动距离) */
    CGFloat _waveY;
    /** 水纹速度 */
    CGFloat _waveSpeed;
    /** 水纹宽度 */
    CGFloat _waveWidth;
}

/** 进度显示 */
@property (nonatomic, strong) UILabel *progressLabel;
/** 波浪 */
@property (nonatomic, strong) CAShapeLayer *waveLayer;
/** 边框 */
@property (nonatomic, strong) CAShapeLayer *borderLayer;
/** 定时器 */
@property (nonatomic, strong) CADisplayLink *disPlayLink;

@end

@implementation ZXYWaveProgress

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
    
    _waveA = 0;//0%时 振幅为0
    _waveP = 0.03;
    _waveY = self.bounds.size.height;//0%时 无
    _waveX = 0;
    _waveSpeed = 0.08;
    _waveWidth = self.bounds.size.width;
    
    CGPoint origin = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGFloat radius = self.bounds.size.width / 2;
    
    [self.layer addSublayer:self.waveLayer];
    [self.layer addSublayer:self.borderLayer];
    [self addSubview:self.progressLabel];
    
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithArcCenter:origin radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    _borderLayer.path = borderPath.CGPath;
    _borderLayer.fillColor = [UIColor clearColor].CGColor;
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = borderPath.CGPath;
    self.layer.mask = maskLayer;
    
    self.disPlayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [self.disPlayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark - disPlayLink方法
- (void)getCurrentWave {
    _waveX += _waveSpeed;
    if (_waveX > self.bounds.size.width * 2) {
        _waveX = 0;
    }
    [self drawPath];
}

#pragma mark - 绘制路径
- (void)drawPath {
    
    CGFloat y = _waveY;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, y)];
    for (CGFloat x = 0.0; x <= _waveWidth; x++) {
        y = _waveA * sin(_waveP * x + _waveX + 0.5) + _waveY;
        [path addLineToPoint:CGPointMake(x, y)];
    }
    [path addLineToPoint:CGPointMake(_waveWidth, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path closePath];
    _waveLayer.path = path.CGPath;
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

- (CAShapeLayer *)borderLayer {
    if (!_borderLayer) {
        _borderLayer = [CAShapeLayer layer];
    }
    return _borderLayer;
}

- (CAShapeLayer *)waveLayer {
    if (!_waveLayer) {
        _waveLayer = [CAShapeLayer layer];
    }
    return _waveLayer;
}

#pragma mark - setMethod
- (void)setProgress:(CGFloat)progress {
    
    _progress = progress;
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
    
    _waveY = (1 - progress) * self.bounds.size.height;
    if (progress == 0.0 || progress == 1.0) {
        _waveA = 0;
    } else {
        _waveA = 10;
    }
    
    [self drawPath];
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    _waveLayer.fillColor = _fillColor.CGColor;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    _borderLayer.strokeColor = _strokeColor.CGColor;
}

@end

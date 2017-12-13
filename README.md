# ProgressView

### 五种自定义的圆形进度

###### 1.扇形进度
```
ZXYSectorProgress *sectorProgress = [[ZXYSectorProgress alloc] initWithFrame:CGRectMake(10, 50, 150, 150) progress:0];
sectorProgress.fillColor = [UIColor yellowColor];//设置进度颜色
[self.view addSubview:sectorProgress];
```

###### 2.圆形进度
```
ZXYBallProgress *ballProgress = [[ZXYBallProgress alloc] initWithFrame:CGRectMake(215, 50, 150, 150) progress:0];
ballProgress.fillColor = [UIColor yellowColor];//设置进度颜色
ballProgress.strokeColor = [UIColor redColor];//设置边框颜色
[self.view addSubview:ballProgress];
```

###### 3.圆弧进度
```
ZXYCircleProgress *circleProgress = [[ZXYCircleProgress alloc] initWithFrame:CGRectMake(10, 467, 150, 150) progress:0];
circleProgress.progressWidth = 10;//设置进度宽度
circleProgress.bottomColor = [UIColor redColor];//设置底层圆弧颜色
circleProgress.topColor = [UIColor cyanColor];//设置进度颜色;
[self.view addSubview:circleProgress];
```

###### 4.波浪进度
```
ZXYWaveProgress *waveProgress = [[ZXYWaveProgress alloc] initWithFrame:CGRectMake(215, 467, 150, 150) progress:0];
waveProgress.fillColor = [UIColor redColor];//设置进度颜色
waveProgress.strokeColor = [UIColor blackColor];//设置边框颜色
[self.view addSubview:waveProgress];
```

###### 5.渐变色圆弧进度
```
ZXYGradientProgress *gradientProgress = [[ZXYGradientProgress alloc] initWithFrame:CGRectMake(0, 0, 150, 150) progress:0];
gradientProgress.center = self.view.center;
gradientProgress.bottomColor = [UIColor purpleColor];//设置底层圆弧颜色
[self.view addSubview:gradientProgress];
```
[简书文章地址](http://www.jianshu.com/p/08dc5ff5ea9a)

![image](https://github.com/ZhaoGluTtoNy/ProgressView/blob/master/ProgressView/ZXYProgressView/demo.gif)

//
//  ViewController.m
//  贝塞尔曲线和CAShapeLayer
//
//  Created by lanou3g on 15/11/7.
//  Copyright © 2015年 王国威. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    double add ;
}

@property(nonatomic,strong) CAShapeLayer * shapeLayer ;

@property(nonatomic,strong)NSTimer * timer ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer] ;
    self.shapeLayer.frame = CGRectMake(0 , 0, 200, 200) ;
    self.shapeLayer.position = self.view.center ;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor ;
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 1.0f ;
    self.shapeLayer.strokeColor = [UIColor blackColor].CGColor ;
    
    //创建贝塞尔曲线
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)] ;
    
    //让贝塞尔曲线和CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath ;
    
    [self.view.layer addSublayer:self.shapeLayer] ;
    
    //设置stroke起始点
    self.shapeLayer.strokeStart = 0 ;
    self.shapeLayer.strokeEnd = 0.75 ;
    
    //每次递增0.1
    add = 0.1 ;
    //用定时器模拟数值输入的情况
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(circleAnimationTypeOne) userInfo:nil repeats:YES] ;
    
    

}

-(void)circleAnimationTypeOne{
    if (self.shapeLayer.strokeEnd > 1 && self.shapeLayer.strokeStart < 1) {
        self.shapeLayer.strokeStart += add;
    }else if (self.shapeLayer.strokeStart == 0){
        self.shapeLayer.strokeEnd += add ;
    }
    if (self.shapeLayer.strokeEnd == 0) {
        self.shapeLayer.strokeStart = 0 ;
    }
    if (self.shapeLayer.strokeStart == self.shapeLayer.strokeEnd) {
        self.shapeLayer.strokeEnd = 0 ;
    }
    
}



@end

//
//  ViewController.m
//  CircleRoundAnmation
//
//  Created by gitBurning on 2017/6/23.
//  Copyright © 2017年 BR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self useAnmation];
  //  [self useKeyAnmation];
    // Do any additional setup after loading the view, typically from a nib.
}


/**
 帧动画
 */
- (void)useKeyAnmation {
    
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    UIImageView *sadad = [[UIImageView alloc] init];
    sadad.frame = CGRectMake(0, 0, 100, 100);
    sadad.image = [UIImage imageNamed:@"round_anamtion"];
    [self.view addSubview:sadad];
    
    // 方法 1
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = YES;//动画完成 是否还原到以前状态
    pathAnimation.duration = 6.0;
    pathAnimation.repeatCount = 1000;
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake((screenFrame.size.width - 200)/2.0, 100, 200, 200) cornerRadius:100];
    pathAnimation.path = path.CGPath;
    CAShapeLayer *alayer = [CAShapeLayer layer];
    alayer.path = path.CGPath;
    [self.view.layer addSublayer:alayer];
    alayer.strokeColor = [UIColor redColor].CGColor;
    alayer.fillColor = [UIColor clearColor].CGColor;
    [self.view bringSubviewToFront:sadad];
    
    [sadad.layer addAnimation:pathAnimation forKey:@"sadasda"];
}


/**
 CABasicAnimation 这种不行。。待研究
 */
-(void)useAnmation {
    
    
    
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    UIImageView *sadad = [[UIImageView alloc] init];
    sadad.frame = CGRectMake(0, 0, 100, 100);
    sadad.image = [UIImage imageNamed:@"round_anamtion"];
    [self.view addSubview:sadad];
    
    // 方法 1
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
//    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = YES;//动画完成 是否还原到以前状态
    pathAnimation.duration = 6.0;
    pathAnimation.repeatCount = 1000;
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake((screenFrame.size.width - 200)/2.0, 100, 200, 200) cornerRadius:100];
//    pathAnimation.path = path.CGPath;
    pathAnimation.toValue = (__bridge id)path.CGPath;
    pathAnimation.fromValue = (__bridge id)path.CGPath;

    CAShapeLayer *alayer = [CAShapeLayer layer];
    alayer.path = path.CGPath;
    [self.view.layer addSublayer:alayer];
    alayer.strokeColor = [UIColor redColor].CGColor;
    alayer.fillColor = [UIColor clearColor].CGColor;
    [self.view bringSubviewToFront:sadad];
    
    [sadad.layer addAnimation:pathAnimation forKey:@"sadasda"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

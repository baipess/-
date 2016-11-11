//
//  ViewController.m
//  02-截屏
//
//  Created by Gavin on 15/9/14.
//  Copyright (c) 2015年 Gavin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //1.开启图片上下文.
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    //获取当前的上下文.
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    
    //UIView之所能够显示,是因为它内部有一个层,layer.层是通过渲染的方法,给绘制上下文.
    [self.view.layer renderInContext:ctx];
    
    //生成一张图片.
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //如何把图片转换成二进流.
    NSData *data = UIImagePNGRepresentation(newImage);
    [data writeToFile:@"/Users/chenjialin/Desktop/newImage.png" atomically:YES];
    
    //关闭上下文.
    UIGraphicsEndImageContext();
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

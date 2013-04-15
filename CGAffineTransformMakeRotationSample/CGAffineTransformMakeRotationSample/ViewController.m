//
//  ViewController.m
//  CGAffineTransformMakeRotationSample
//
//  Created by 廣川政樹 on 2013/04/15.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

UIButton *_button;
UILabel *_label;

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self initButton];
	[self initLabel];
  [self startAnimation];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (void)initButton
{

}

- (void)initLabel
{
  _label.text = @"Animation";
  _label.center = CGPointMake(50, 50);
  [self.view addSubview:_label];
}

- (void)startAnimation
{
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:2];
  _label.center = CGPointMake(160, 240);
  _label.transform = CGAffineTransformMakeRotation(270 * M_PI/180);
  [UIView commitAnimations];
}

@end

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

@implementation ViewController

//ボタンの横幅
int _buttonWidth = 58;
//ボタンの縦幅
int _buttonHeight = 42;
//ボタンと画面端とのマージン
int _buttonMargin = 18;
//ラベルの横幅
int _labelWidth = 100;
//ラベルの縦幅
int _labelHeight = 40;
//ラベルの基点 (X座標)
int _labelBaseX = -40;
//ラベルの基点 (Y座標)
int _labelBaseY = 0;
//ラベルの目標値 (X座標)
int _labelAimX = 240;
//ラベルの目標値 (Y座標)
int _labelAimY = 320;
//アニメーション秒数
float animationDuration = 2.0f;

- (void)viewDidLoad
{
  [super viewDidLoad];
  //ボタン初期化
  [self initButton];
  //ラベル初期化
	[self initLabel];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

//ボタン初期化
- (void)initButton
{
  //ボタンを角丸にする
  self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  //ボタンの座標と寸法を定義
  self.button.frame = CGRectMake(self.view.frame.size.width - _buttonWidth - _buttonMargin,
                                 self.view.frame.size.height - _buttonHeight - _buttonMargin,
                                 _buttonWidth,
                                 _buttonHeight);
  //ボタンのタイトル定義
  [self.button setTitle:@"Start"
               forState:UIControlStateNormal];
  [self.button sizeToFit];
  //ボタンをタップで startAnimationメソッドを呼び出し
  [self.button addTarget:self
                  action:@selector(startAnimation:)
        forControlEvents:UIControlEventTouchUpInside];
  //ステージに追加
  [self.view addSubview:self.button];
}

//ラベル初期化
- (void)initLabel
{
  //ラベルの座標と寸法を定義
  self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _labelWidth, _labelHeight)];
  //ラベルの初期座標を定義
  self.label.center = CGPointMake(_labelBaseX, _labelBaseY);
  //ラベルテキストを代入
  self.label.text = @"Animation";
  //ラベルのテキストカラーを黒にする
  self.label.textColor = [UIColor blackColor];
  //ラベルをセンタリングする
  self.label.textAlignment = NSTextAlignmentCenter;
  //ラベルを viewに配置
  [self.view addSubview:self.label];
}

//アニメーション開始メソッド
- (void)startAnimation:(id)sender
{
  //アニメーション開始
  [UIView beginAnimations:nil context:nil];
  //指定した秒数でアニメーションする
  [UIView setAnimationDuration:animationDuration];
  //アニメーションの開始座標
  self.label.center = CGPointMake(_labelBaseX, _labelBaseY);
  //アニメーションの目標座標
  self.label.center = CGPointMake(_labelAimX, _labelAimY);
  //アフィン変換を使用してアニメーションさせる
  self.label.transform = CGAffineTransformMakeRotation(270 * M_PI/180);
  //アニメーション実行
  [UIView commitAnimations];
}

@end

//
//  ViewController.m
//  DynamicClipImage
//
//  Created by yasic on 2017/11/29.
//  Copyright © 2017年 yasic. All rights reserved.
//

#import "ViewController.h"
#import "YasicClipPage.h"

#import <Masonry.h>
@interface ViewController ()

@property (nonatomic,strong) UIImageView * mainImgv;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainImgv = [[UIImageView alloc]init];
    _mainImgv.image = [UIImage imageNamed:@"TARGET_IMG"];
    _mainImgv.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_mainImgv];
    
    
    [_mainImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(40);
        make.bottom.right.equalTo(self.view).inset(40);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self  action:@selector(startCropImage)];
    [_mainImgv setUserInteractionEnabled: YES];
    [_mainImgv addGestureRecognizer:tap];
    
}


-(void)startCropImage{
    __block YasicClipPage *clipVC = [[YasicClipPage alloc]init];
    clipVC.targetImage = [UIImage imageNamed:@"TARGET_IMG"];
    clipVC.cropSizeRate = 1.0;
    clipVC.allowEditCropRect = YES;
    clipVC.completion = ^(UIImage *clipImage, CGSize clipSize) {
        _mainImgv.image = clipImage;
        
        NSLog(@" %@   %@" ,clipImage,NSStringFromCGSize(clipSize));
        [clipVC dismissViewControllerAnimated:true  completion:nil];
    };
    [self presentViewController:clipVC animated:true  completion:nil ];
    
}


@end

//
//  YasicClipPage.h
//  DynamicClipImage
//
//  Created by yasic on 2017/11/29.
//  Copyright © 2017年 yasic. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completeClipBlock)(UIImage *__nonnull clipImage,CGSize clipSize);
typedef void(^cancelClipBlock)(void);

@interface YasicClipPage : UIViewController
@property (strong, nonatomic,nullable) UIToolbar *toolBar;

@property (strong, nonatomic,nonnull) UIImage *targetImage;
@property (assign, nonatomic) CGFloat cropSizeRate; //default is width/height = 16/9
@property (assign, nonatomic) BOOL allowEditCropRect;   // default is NO.if

@property (strong, nonatomic,nonnull) completeClipBlock completion;
@property (strong, nonatomic,nullable) cancelClipBlock cancel;

-(void)dismiss;

@end

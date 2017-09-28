//
//  ViewController.m
//  savePics
//
//  Created by Yvan on 2017/9/28.
//  Copyright © 2017年 Yvan. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 300, 120)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"UIImageWriteToSavedPhotosAlbum" forState:UIControlStateNormal];
    btn.tag = 1;
    [btn addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 230, 300, 120)];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [btn2 setTitle:@"creationRequestForAssetFromImage" forState:UIControlStateNormal];
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}


-(void)btnClcik:(UIButton *)sender{
    UIImage *image = [UIImage imageNamed:@"logo_76x86"];
    if (sender.tag == 1) {
        
          UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    }else{
        
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            
            PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
            
            
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            
            NSLog(@"success = %d, error = %@", success, error);
            
        }];
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  TwoViewController.m
//  BlockStudy
//
//  Created by tiannuo on 16/5/12.
//  Copyright © 2016年 TianNuo. All rights reserved.
//  3.使用Block作为property，实现两个页面之间传值 类似Delegate传值

#import "TwoViewController.h"

@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputTF;

- (IBAction)popViewCtrl:(UIButton *)sender;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)popViewCtrl:(UIButton *)sender {
    if (self.TwoViewControllerBlock) {
        self.TwoViewControllerBlock(self.inputTF.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end

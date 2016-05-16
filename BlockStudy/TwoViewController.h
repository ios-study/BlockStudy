//
//  TwoViewController.h
//  BlockStudy
//
//  Created by tiannuo on 16/5/12.
//  Copyright © 2016年 TianNuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoViewController : UIViewController
// 3.使用Block作为property，实现两个页面之间传值
@property (nonatomic, copy) void (^TwoViewControllerBlock)(NSString *tf);
@end

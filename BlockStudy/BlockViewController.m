//
//  BlockViewController.m
//  ToolDemo
//
//  Created by tiannuo on 16/5/12.
//  Copyright © 2016年 TianNuo. All rights reserved.
//  Block study

#import "BlockViewController.h"
#import "TwoViewController.h"

@interface BlockViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

- (IBAction)pushNextCtrl:(UIButton *)sender;
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.Block内部变量学习
//    [self oneBlockTest];
    // 2.__block关键字的使用
//    [self blockOperation];
}

/**
 *  2.__block关键字的使用
 
    注意点：在Block的{}体内，是不可以对外面的变量进行更改的
    报错：Variable is not assigning (missing __block type specifier)
    解决方法：加上__block关键字即可修改外部变量
 
 */
- (void)blockOperation
{
    // 将Block定义在方法内部
//    int x = 100;
//    void (^sumXAndYBlock)(int) = ^(int y){
//        x = x + y;
//        NSLog(@"new x value is %d", x);
//    };
//    sumXAndYBlock(50);
    
    __block int x = 100;
    // 有参数无返回值
    void (^sumXAndYBlock)(int) = ^(int y){
        x = x + y;
        NSLog(@"new x value is %d", x);
    };
    sumXAndYBlock(50);

}

/**
 *  1.Block内部变量学习
     void (^printBlock)(int)
 
    void是返回值 int是参数列表
 */
- (void)oneBlockTest
{
    // 1.定义无参无返回值的Block
    void (^printBlock)() = ^(){
        NSLog(@"no number");
    };
    printBlock();
    
    int mutiplier = 5;
    // 2.定义为myBlock的代码块，返回值类型为int
    int (^myBlock)(int) = ^(int num){
        return num * mutiplier;
    };
    
    int newNum = myBlock(3);
    NSLog(@"newNum is %d", newNum);
    
    printNumBlock(8);

}

// 定义一个有参数，没有返回值的Block
void (^printNumBlock)(int) = ^(int num){
    NSLog(@"int number is %d", num);
};

/** Block的定义
 *  （1）在类中，定义一个Block变量，就像定义一个函数；
 
    （2）Block可以定义在方法内部，也可以定义在方法外部；
 
    （3）只有调用Block时候，才会执行其{}体内的代码；
 */

- (IBAction)pushNextCtrl:(UIButton *)sender {
    TwoViewController *twoCtrl = [[TwoViewController alloc] init];
    twoCtrl.TwoViewControllerBlock = ^(NSString *tf){
        [self resetLabel:tf];
    };
    [self.navigationController pushViewController:twoCtrl animated:YES];
}

#pragma mark - NextViewControllerBlock method
- (void)resetLabel:(NSString *)textStr
{
    self.textLabel.text = textStr;
}
@end

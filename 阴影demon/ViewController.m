//
//  ViewController.m
//  阴影demon
//
//  Created by 吴俊明 on 2018/5/22.
//  Copyright © 2018年 吴俊明. All rights reserved.
//

#import "ViewController.h"
#import "XMView.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
    
    XMView *xmView = [[XMView alloc] initWithFrame:CGRectMake(100, 100, 150, 200)];
    [self.view addSubview:xmView];
    
}

@end

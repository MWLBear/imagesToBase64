//
//  ViewController.m
//  ls
//
//  Created by lz on 2018/5/17.
//  Copyright © 2018年 lz. All rights reserved.
//

#import "ViewController.h"
#import "Tool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Tool imagesToBase64WithBundleName:@"lz.bundle" withToPath:@"/Users/lz/Desktop/a.txt"];
}
@end

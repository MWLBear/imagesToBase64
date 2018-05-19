//
//  Tool.h
//  ls
//
//  Created by lz on 2018/5/19.
//  Copyright © 2018年 lz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tool : NSObject

/*
 bundle 图片批量写入txt中
 
 png图片
 
 txt输出格式:
 static NSString*imageName=@"xxxxxxxx";
 static NSString*imageName=@"xxxxxxxx";
 static NSString*imageName=@"xxxxxxxx";
 ....
 */
+(void)imagesToBase64WithBundleName:(NSString*)bundleName withToPath:(NSString*)path;
@end

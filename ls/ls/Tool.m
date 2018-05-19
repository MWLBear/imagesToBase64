//
//  Tool.m
//  ls
//
//  Created by lz on 2018/5/19.
//  Copyright © 2018年 lz. All rights reserved.
//

#import "Tool.h"

@implementation Tool


+(void)imagesToBase64WithBundleName:(NSString *)bundleName withToPath:(NSString *)path{
    
    if (![bundleName.pathExtension isEqualToString:@"bundle"])return;
    if (![path.pathExtension isEqualToString:@"txt"]) return;
    
    NSMutableArray*imageName = [NSMutableArray arrayWithCapacity:100];
    NSString*bundlePath =  [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:bundleName];
    NSLog(@"bundlePath= %@",bundlePath);
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSArray*arry = [bundle pathsForResourcesOfType:@"png" inDirectory:nil];
    NSArray*sorArr = [arry sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    for (NSInteger i = 0; i<sorArr.count; i++) {
        
        NSString*imageNameNoPng = [[sorArr[i]lastPathComponent]stringByReplacingOccurrencesOfString:@".png" withString:@""]; //图片名去掉后缀
        UIImage *image = [UIImage imageWithContentsOfFile:sorArr[i]];
        NSString *base64 = [Tool removeSpaceAndNewline:[Tool imageToBase64:image]];
        
        NSString *str = [NSString stringWithFormat:@"static NSString*%@=@\"%@\";",imageNameNoPng,base64]; //拼接字符串.
        NSString *string = [NSString stringWithFormat:@"%@\r\n", str];
        NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:path];
        [handle seekToEndOfFile];
        
        NSData*data = [string dataUsingEncoding:NSUTF8StringEncoding];
        [handle writeData:data];
        [handle closeFile];
        
        NSLog(@" %@ \n",str);
        [imageName addObject:[arry[i]lastPathComponent]];
    }
    
}
//图片转base64
+(NSString*)imageToBase64:(UIImage*)image{
    
    NSData *data = UIImagePNGRepresentation(image);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

//base64转图片
-(UIImage*)base64Toimage:(NSString*)str{
    NSData *decodedImageData = [[NSData alloc]initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
    return decodedImage;
}

//去掉字符串的空格换行
+(NSString *)removeSpaceAndNewline:(NSString *)str
{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
}

-(void)write:(NSString*)str{
    
    NSString*docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *txtPath = [docPath stringByAppendingPathComponent:@"objc.txt"];
    
    NSFileHandle *handle = [NSFileHandle fileHandleForUpdatingAtPath:txtPath];
    [handle seekToEndOfFile];
    
    NSData*data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [handle writeData:data];
    [handle closeFile];
    NSLog(@"path = %@",txtPath);
}
@end

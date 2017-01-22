//
//  PlistCache.m
//  CacheDemo
//
//  Created by 黄露 on 2017/1/21.
//  Copyright © 2017年 黄露. All rights reserved.
//

#import "PlistCache.h"

#define CACHEPATH ([NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject])

@interface PlistCache ()

@property (nonatomic ,copy ,    readwrite) NSString *name;
@property (nonatomic ,strong ,  readwrite) NSMutableDictionary *data;
@property (nonatomic ,copy ,    readwrite) NSString *filePath;

@end

@implementation PlistCache

+ (BOOL) existFileWithName:(NSString *)name {
    NSString *pathFile = [NSString stringWithFormat:@"%@/%@.plist",CACHEPATH , name];
    NSLog(@"pathFIle = %@",pathFile);
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:pathFile];
}

+ (BOOL) creatFileWithName:(NSString *)name {
    if (![self existFileWithName:name]) {
        NSString *pathFile = [NSString stringWithFormat:@"%@/%@.plist",CACHEPATH , name];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        return [fileManager createFileAtPath:pathFile contents:nil attributes:nil];
    }
    
    return YES;
}

- (instancetype) initWithName:(NSString *)name {
    if (self = [super init]) {
        
        self.name = name;
        NSString *pathString = [NSString stringWithFormat:@"%@/%@.plist",CACHEPATH,name];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        BOOL isDir;
        BOOL isFile = [fileManager fileExistsAtPath:pathString isDirectory:&isDir];
        if (isFile) {
            self.filePath = pathString;
            self.data = [NSMutableDictionary dictionaryWithContentsOfFile:pathString] ? [NSMutableDictionary dictionaryWithContentsOfFile:pathString] : [NSMutableDictionary dictionary];
        }
    }
    return self;
}

- (BOOL) cacheValueForKey:(NSString *)key withValue:(id)value {
    [self.data setValue:value forKey:key];
    return [self.data writeToFile:self.filePath atomically:YES];
}

- (BOOL) deleteCacheForKey:(NSString *)key {
    
    [self.data removeObjectForKey:key];
    return [self.data writeToFile:self.filePath atomically:YES];
}


- (BOOL) updateCacheForKey:(NSString *)key withCalue:(id)value {
    [self.data removeObjectForKey:key];
    [self.data setValue:value forKey:key];
    return [self.data writeToFile:self.filePath atomically:YES];
}

- (id) loadValueForKey:(NSString *)key {
    id obj = [self.data valueForKey:key];
    
    return obj;
}

@end

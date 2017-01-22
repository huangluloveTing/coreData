//
//  PlistCache.h
//  CacheDemo
//
//  Created by 黄露 on 2017/1/21.
//  Copyright © 2017年 黄露. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistCache : NSObject

@property (nonatomic ,readonly ,copy    ) NSString *name;
@property (nonatomic ,readonly ,strong  ) NSMutableDictionary *data;
@property (nonatomic ,readonly ,copy    ) NSString *filePath;

//判断文件名是否存在
+ (BOOL) existFileWithName:(NSString *)name;

+ (BOOL) creatFileWithName:(NSString *)name;

//根据文件名获取数据
- (instancetype) initWithName:(NSString *)name;

- (BOOL) cacheValueForKey:(NSString *)key withValue:(id)value;
- (BOOL) updateCacheForKey:(NSString *)key withCalue:(id)value;
- (BOOL) deleteCacheForKey:(NSString *)key;
- (id) loadValueForKey:(NSString *)key;

- (instancetype) init NS_UNAVAILABLE;

@end

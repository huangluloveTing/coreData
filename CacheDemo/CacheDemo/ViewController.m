//
//  ViewController.m
//  CacheDemo
//
//  Created by 黄露 on 2017/1/21.
//  Copyright © 2017年 黄露. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDelegate , UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BOOL isExit = [PlistCache existFileWithName:@"Demo"];
    if (!isExit) {
        
        if ([PlistCache creatFileWithName:@"Demo"]) {
            PlistCache *pathCache = [[PlistCache alloc] initWithName:@"Demo"];
            BOOL cache = [pathCache cacheValueForKey:@"h1" withValue:@"hsffsfks"];
            [pathCache cacheValueForKey:@"h2" withValue:@"kksjfks"];
            
            NSLog(@"cache = %d",cache);
        }
    }
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"coll"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    PlistCache *pl = [[PlistCache alloc] initWithName:@"Demo"];
    
    NSLog(@"hl : %@", [pl loadValueForKey:@"h1"]);
    NSLog(@"h2 : %@", [pl loadValueForKey:@"h2"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 20;
}
- (IBAction)rightBtnAction:(id)sender {
    [self showTextFleidView];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll" forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor redColor];
    
    return cell;
}


- (void) showTextFleidView {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
//    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"请输入密码";
//    }];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}


@end

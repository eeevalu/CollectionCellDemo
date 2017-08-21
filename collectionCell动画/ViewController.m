//
//  ViewController.m
//  collectionCell动画
//
//  Created by Eva on 16/12/19.
//  Copyright © 2016年 Eva. All rights reserved.
//
#define NSLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);

#import "ViewController.h"
#import "CollectionViewFlowLayout.h"
#import "Cell.h"

static NSString *identifier = @"c";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic)  UICollectionView *collectionView;

@property (strong, nonatomic)  CollectionViewFlowLayout *layout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _layout = [[CollectionViewFlowLayout alloc] init];
    _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout.minimumLineSpacing = -8;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 200) collectionViewLayout:_layout];
    _collectionView.backgroundColor = [UIColor orangeColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self.view addSubview:_collectionView];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.collectionView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellWithReuseIdentifier:identifier];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.layout.itemSize = CGSizeMake(200, 200);
    _collectionView.contentOffset = CGPointMake(_collectionView.contentSize.width / 2 - self.view.bounds.size.width/2, 0);

//    self.layout.sectionInset = UIEdgeInsetsMake(0, 100, 0, 100);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%lf",_collectionView.contentSize.width);
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

@end

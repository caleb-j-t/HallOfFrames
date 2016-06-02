//
//  ViewController.m
//  HallOfFrames
//
//  Created by Caleb Talbot on 6/2/16.
//  Copyright © 2016 Caleb Talbot. All rights reserved.
//

#import "ViewController.h"
#import "Picture.h"
#import <UIKit/UIKit.h>

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property NSMutableArray *galleryPhotos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *galleryPhotos = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"Picture1"],[UIImage imageNamed:@"Picture2"],[UIImage imageNamed:@"Picture3"],[UIImage imageNamed:@"Picture4"],[UIImage imageNamed:@"Picture5"], nil];
    

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureCell" forIndexPath:indexPath];

    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.galleryPhotos.count;
}

@end

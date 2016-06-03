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
#import "PictureCollectionViewCell.h"
#import "CustomView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, CustomViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *galleryCollectionView;
@property NSMutableArray *galleryPhotos;
@property UIColor *colorForBackground;
@property CustomView *colorSelector;
@property Picture *pictureToChangeBackgroundColor;
@property PictureCollectionViewCell *selectedCell;
@property NSIndexPath *indexPathForTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Picture *picture1 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture1"] andColor:[UIColor blackColor]];
    Picture *picture2 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture2"] andColor:[UIColor blackColor]];
    Picture *picture3 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture3"] andColor:[UIColor blackColor]];
    Picture *picture4 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture4"] andColor:[UIColor blackColor]];
    Picture *picture5 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture5"] andColor:[UIColor blackColor]];
    
    self.galleryPhotos = [NSMutableArray arrayWithObjects: picture1, picture2, picture3, picture4, picture5,  nil];
    
}

-(void)didTapXibButton:(UIButton *)button {
    
    if([button.titleLabel.text isEqualToString:@"Blue"]) {
        self.colorForBackground = [UIColor blueColor];
    }else if ([button.titleLabel.text isEqualToString:@"Green"]) {
        self.colorForBackground = [UIColor greenColor];
    }else {
        self.colorForBackground = [UIColor yellowColor];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        [self.galleryCollectionView reloadData];
    }];
    
    
    self.pictureToChangeBackgroundColor.frameColor = self.colorForBackground;
//    PictureCollectionViewCell *cell = [self.galleryCollectionView cellForItemAtIndexPath:self.indexPathForTest];
    
    
    [self.colorSelector removeFromSuperview];
    [self.galleryCollectionView reloadData];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureCell" forIndexPath:indexPath];
    
    Picture *pictureForCell = self.galleryPhotos[indexPath.row];
    cell.photoForCell.image = pictureForCell.picture;
    cell.coloredFrame.backgroundColor = pictureForCell.frameColor;
    NSLog(@"color is %@", self.colorForBackground);
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.galleryPhotos.count;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.indexPathForTest = indexPath;
    
    // Made a variable that contains the .xib which is of class CustomView
    self.pictureToChangeBackgroundColor = self.galleryPhotos[indexPath.row];
//    self.selectedCell = [self.galleryCollectionView cellForItemAtIndexPath:indexPath.row];
//    
    self.colorSelector = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    
    //passed method addSubview to the viewcontrollers view property
    [self.view addSubview:self.colorSelector];
    
    //resigned the VC's view's firstResponder
    [self.view resignFirstResponder];
    
    //centered the subview
    self.colorSelector.center = self.view.center;
    
//    PictureCollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
//    selectedCell.backgroundColor
    self.colorSelector.delegate = self;
}


@end

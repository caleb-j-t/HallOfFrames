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
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *galleryPhotos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.galleryPhotos = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"Picture1"],[UIImage imageNamed:@"Picture2"],[UIImage imageNamed:@"Picture3"],[UIImage imageNamed:@"Picture4"],[UIImage imageNamed:@"Picture5"], nil];

    Picture *picture1 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture1"] andColor:[UIColor greenColor]];
    Picture *picture2 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture2"] andColor:[UIColor greenColor]];
    Picture *picture3 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture3"] andColor:[UIColor greenColor]];
    Picture *picture4 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture4"] andColor:[UIColor greenColor]];
    Picture *picture5 = [[Picture alloc] initWithPicture:[UIImage imageNamed:@"Picture5"] andColor:[UIColor greenColor]];
    
    self.galleryPhotos = [NSMutableArray arrayWithObjects: picture1, picture2, picture3, picture4, picture5,  nil];
    
    if (self.collectionView.allowsSelection) {
        NSLog(@"it is collection view selectable");
    }
    
    
}

-(void)didTapXibButton:(UIButton *)button {
    if([button.titleLabel.text isEqualToString:@"Red"]) {
        //continue from here!!!
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureCell" forIndexPath:indexPath];
    
    Picture *pictureForCell = self.galleryPhotos[indexPath.row];
    cell.photoForCell.image = pictureForCell.picture;
   
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.galleryPhotos.count;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // Made a variable that contains the .xib which is of class CustomView
    CustomView *colorSelector = [[[NSBundle mainBundle] loadNibNamed:@"CustomizationView" owner:self options:nil] objectAtIndex:0];
    
    //passed method addSubview to the viewcontrollers view property
    [self.view addSubview:colorSelector];
    
    //resigned the VC's view's firstResponder
    [self.view resignFirstResponder];
    
    //centered the subview
    colorSelector.center = self.view.center;
    
//    PictureCollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
//    selectedCell.backgroundColor
    colorSelector.delegate = self;
}


@end

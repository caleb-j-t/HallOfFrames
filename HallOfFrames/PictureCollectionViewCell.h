//
//  PictureCollectionViewCell.h
//  HallOfFrames
//
//  Created by Caleb Talbot on 6/2/16.
//  Copyright © 2016 Caleb Talbot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoForCell;
@property (weak, nonatomic) IBOutlet UIImageView *coloredFrame;

@end

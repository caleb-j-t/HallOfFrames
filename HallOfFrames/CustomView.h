//
//  CustomView.h
//  HallOfFrames
//
//  Created by Mike Nancett on 6/2/16.
//  Copyright © 2016 Caleb Talbot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureCollectionViewCell.h"

@class CustomView;

@protocol CustomViewDelegate <NSObject>

@optional

-(void)didTapXibButton:(UIButton *)button;

@end

@interface CustomView : UIView

@property (nonatomic,weak) id <CustomViewDelegate>delegate;

@end

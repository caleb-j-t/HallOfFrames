//
//  Picture.m
//  HallOfFrames
//
//  Created by Caleb Talbot on 6/2/16.
//  Copyright © 2016 Caleb Talbot. All rights reserved.
//

#import "Picture.h"



@implementation Picture

- (instancetype)initWithPicture:(UIImage *)originalPicture andColor:(UIColor *)color{
    if (self) {
        self.picture = originalPicture;
        self.frameColor = color;
    }
    return self;
}


@end

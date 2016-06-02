//
//  CustomView.m
//  HallOfFrames
//
//  Created by Mike Nancett on 6/2/16.
//  Copyright © 2016 Caleb Talbot. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (IBAction)onXibButtonTapped:(id)sender {
    [self.delegate didTapXibButton:sender];
    
}


@end

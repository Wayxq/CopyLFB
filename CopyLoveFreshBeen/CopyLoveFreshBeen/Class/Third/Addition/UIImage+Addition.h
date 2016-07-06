//
//  UIImage+Addition.h
//  tibbr
//
//  Created by Reefaq on 17/10/12.
//  Copyright (c) 2012 Reefaq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)
- (UIImage *)roundCornerImageWithWidth:(NSUInteger)ovalWidth height:(NSUInteger)ovalHeight;

+(UIImage*) drawText:(NSString*)text
             inImage:(UIImage*)image
             atPoint:(CGPoint)point
            withFont:(UIFont*)textFont
       withTextColor:(UIColor*)textColor;

- (UIImage *)fixOrientation;

- (UIImage *) scaleToSize: (CGSize)size;
- (UIImage *) scaleProportionalToSize: (CGSize)size;
- (UIImage*)imageWithImage:(UIImage*)sourceImage scaledToSizeKeepingAspect:(CGSize)targetSize;
- (UIImage*)cropImageToRect:(CGRect)cropRect;


@end

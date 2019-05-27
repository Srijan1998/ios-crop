//
//  SecondViewController.h
//  crop
//
//  Created by Srijan Bhatia on 25/05/19.
//  Copyright © 2019 Srijan Bhatia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *CroppedImage;
@property (nonatomic) UIImage *simage;

@end

NS_ASSUME_NONNULL_END

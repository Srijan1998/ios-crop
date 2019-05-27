//
//  ViewController.h
//  crop
//
//  Created by Srijan Bhatia on 25/05/19.
//  Copyright © 2019 Srijan Bhatia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *InputImage;
@property (nonatomic,readwrite) IBOutlet UIBezierPath *path;

@end
UIBezierPath *path1;

//
//  ViewController.m
//  ObjectCPPSample
//
//  Created by Cheng-Lun Li on 5/3/15.
//  Copyright (c) 2015 Cheng-Lun Li. All rights reserved.
//

#import "ViewController.h"
using namespace cv;

@interface ViewController () {
    CppClass *_pCppClass;
    cv::Mat *cppImage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pCppClass = new CppClass(5);
    NSLog(@"number is %d", _pCppClass->whatsTheNumber(123));
    NSLog(@"counter is %d", _pCppClass->counter);
    
    UIImage *sampleImage = [UIImage imageNamed:@"wordgrain.jpg"];
    cv::Mat cvImage = [self cvMatFromUIImage:sampleImage];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    delete _pCppClass;
}

- (cv::Mat)cvMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    
    return cvMat;
}

@end

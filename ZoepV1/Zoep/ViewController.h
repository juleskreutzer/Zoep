//
//  ViewController.h
//  Zoep
//
//  Created by Jules Kreutzer on 14-01-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController
{
    ADBannerView *bannerView;
}
@property (weak, nonatomic) IBOutlet UITextField *speler_1;
@property (weak, nonatomic) IBOutlet UITextField *speler_2;
@property (weak, nonatomic) IBOutlet UITextField *speler_3;
@property (weak, nonatomic) IBOutlet UITextField *speler_4;




@end


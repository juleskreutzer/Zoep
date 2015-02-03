//
//  AddZoepViewController.m
//  Zoep
//
//  Created by Jules Kreutzer on 03-02-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

#import "AddZoepViewController.h"

@interface AddZoepViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *DoneButton;

@end

@implementation AddZoepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.DoneButton) return;
    if (self.textField.text.length > 0) {
        self.zoep = [[Zoep alloc] init];
        self.zoep.playername = self.textField.text;
        self.zoep.checked = NO;
    }
}
@end

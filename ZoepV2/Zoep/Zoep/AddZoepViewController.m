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

@property (nonatomic, retain) NSMutableArray *zoepers;

@end

@implementation AddZoepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _textField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;    
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.DoneButton) return;
    
    if (self.textField.text.length > 0) {
        self.zoep = [[Zoep alloc] init];
        self.zoep.playername = self.textField.text;
        self.zoep.checked = nil;
        [self.zoepers addObject:self.textField.text];
    }
    else
    {
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Zoepnaam te kort" message:@"Geef een naam op voor de Zoep slimmerik!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [bericht show];
    }
}


@end

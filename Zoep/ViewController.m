//
//  ViewController.m
//  Zoep
//
//  Created by Jules Kreutzer on 14-01-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// int voor random aanmaken
int willekeurig;
// int aantal wordt gevuld door het aantal namen dat is ingevuld.
int aantal;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(UIButton *)sender {
    NSString *speler1 = self.speler_1.text;
    NSString *speler2 = self.speler_2.text;
    NSString *speler3 = self.speler_3.text;
    NSString *speler4 = self.speler_4.text;
    
    if ([speler1  isEqual: @""])
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Naam vergeten!" message:@"Vul de naam in van de eerste speler!" delegate:nil cancelButtonTitle:@"Begrepen" otherButtonTitles:nil, nil];
        
        [message show];
    }
    
    if([speler2 isEqual: @""])
    {
        UIAlertView *message = [[UIAlertView alloc]initWithTitle:@"Naam vergeten!" message:@"Je bent de naam van de tweede speler vergeten!" delegate:nil cancelButtonTitle:@"Begrepen" otherButtonTitles:nil, nil];
        [message show];
    }
    
    // Controleren of alle velder zijn ingevuld
    if(![speler3 isEqual: @""] && ![speler4 isEqual: @""])
    {
        aantal = 4;
    }
    
    // Speler vier is niet ingevuld, aantal spelers = 3
    if([speler4 isEqual:@""])
    {
        aantal = 3;
    }
    
    // Speler drie is niet ingevuld, aantal speler = 2
    if ([speler3 isEqual: @""])
    {
        aantal = 2;
    }
    
    willekeurig = rand()%aantal+1;
    
    if(willekeurig == 1){
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"En de winnaar is:" message:[ NSString stringWithFormat:@"Gefeliciteerd, %@, jij mag dringen gaan halen!",speler1] delegate:nil cancelButtonTitle:@"Leuk!" otherButtonTitles:nil, nil];
        
        [bericht show];
    }
    
    if(willekeurig == 2)
    {
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"YAY" message:[NSString stringWithFormat: @"%@, ik vind het ook niet leuk, maar nu is het jouw beurt.", speler2] delegate:nil cancelButtonTitle:@"Gesnopen" otherButtonTitles:nil, nil];
        [bericht show];
    }
    
    if(willekeurig == 3)
    {
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Prijs!" message:[NSString stringWithFormat:@"Nu mag jij, %@", speler3] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [bericht show];
    }
    
    if(willekeurig == 4)
    {
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Helaas!" message:[NSString stringWithFormat:@"Nu ben jij de sjaak, %@.", speler4] delegate:nil cancelButtonTitle:@"Jammer, maar oké" otherButtonTitles:nil, nil];
        [bericht show];
    }
    
    
    
}
- (IBAction)reset:(id)sender {
    self.speler_1.text = @"";
    self.speler_2.text = @"";
    self.speler_3.text = @"";
    self.speler_4.text = @"";
}

@end

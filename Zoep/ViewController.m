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

- (IBAction) textFieldFinishedWithKeyBoard:(id)sender {
     [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reset:(id)sender {
    self.speler_1.text = @"";
    self.speler_2.text = @"";
    self.speler_3.text = @"";
    self.speler_4.text = @"";
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:nil message:@"Alle velden met namen zijn gewist." delegate:nil cancelButtonTitle:@"Super!" otherButtonTitles:nil, nil];
    
    [message show];
}
- (IBAction)play:(id)sender {
    NSString *speler1 = self.speler_1.text;
    NSString *speler2 = self.speler_2.text;
    NSString *speler3 = self.speler_3.text;
    NSString *speler4 = self.speler_4.text;
    
    int error = 0;
    
    if([speler1 isEqual: @""] && [speler2 isEqual: @""])
    {
        ++error;
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Naam vergeten" message:@"Je bent de naam van de eerste of tweede speler vergeten in te vullen!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
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
    
    if(error == 0)
    {
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
}
- (IBAction)info:(id)sender {
    // Nut van de app weergeven en wat extra info
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Heb je weer hulp nodig?!" message:@"Eigenlijk is de app een beetje nutteloos...\n\nGeef twee of meer namen op en er wordt willekeurig een naam gekozen.\n\nWil je liever contact met me opnemen? Dat kan via juleskreutzer@me.com" delegate:nil cancelButtonTitle:@"VET!" otherButtonTitles:nil, nil];
    
    [message show];

}

@end

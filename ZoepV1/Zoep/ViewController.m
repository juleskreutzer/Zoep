//
//  ViewController.m
//  Zoep
//
//  Created by Jules Kreutzer on 14-01-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL _bannerIsVisible;
    ADBannerView *_adBanner;
}
@end

@implementation ViewController

// int voor random aanmaken
int willekeurig;
// int aantal wordt gevuld door het aantal namen dat is ingevuld.
int aantal;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _adBanner = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 50)];
    _adBanner.delegate = self;
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
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:nil message:@"Alle Zoepers zijn geweist!" delegate:nil cancelButtonTitle:@"Begrepen" otherButtonTitles:nil, nil];
    
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
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Naam vergeten" message:@"Je bent de naam van de eerste op tweede Zoep vergeten!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
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
            UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Beste Zoepers" message:[ NSString stringWithFormat:@"We hebben een winnaar Zoepers! De winnaar is: %@. ",speler1] delegate:nil cancelButtonTitle:@"Leuk!" otherButtonTitles:nil, nil];
            
            [bericht show];
        }
        
        if(willekeurig == 2)
        {
            UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"YAY" message:[NSString stringWithFormat: @"Proficiat Zoep %@, deze keer ben jij aan de beurt!", speler2] delegate:nil cancelButtonTitle:@"Gesnopen" otherButtonTitles:nil, nil];
            [bericht show];
        }
        
        if(willekeurig == 3)
        {
            UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Prijs!" message:[NSString stringWithFormat:@"En de zoep winnaar is: %@", speler3] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [bericht show];
        }
        
        if(willekeurig == 4)
        {
            UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Helaas Zoep!" message:[NSString stringWithFormat:@"Nu ben jij de sjaak, %@.", speler4] delegate:nil cancelButtonTitle:@"Jammer, maar oké" otherButtonTitles:nil, nil];
            [bericht show];
        }
    }
}
- (IBAction)info:(id)sender {
    // Nut van de app weergeven en wat extra info
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Bedankt voor het gebruiken van Zoep!" message:@"Hulp nodig? het is heel simpel. \nGeef 2 of meer namen op en druk op play. Er wordt willekeurig een naam van een Zoep gekozen. \n\nIk wil graag weten hoe jij over mijn app denkt. Stuur me dus eens een mail: juleskreutzer@me.com" delegate:nil cancelButtonTitle:@"Sluiten" otherButtonTitles:nil, nil];
    
    [message show];

}

@end

//
//  ZoepTableViewController.m
//  Zoep
//
//  Created by Jules Kreutzer on 03-02-15.
//  Copyright (c) 2015 Jules Kreutzer. All rights reserved.
//

#import "ZoepTableViewController.h"
#import "Zoep.h"
#import "AddZoepViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ZoepTableViewController ()

@property NSMutableArray *zoepers;


@end

@implementation ZoepTableViewController

// NSUInteger aanmaken om deze te kunnen vullen met een random getal
NSUInteger willekeurig;


// Instantie aanmaken om geluid te kunnen afspelen
AVAudioPlayer *audioPlayer;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddZoepViewController *source = [segue sourceViewController];
    Zoep *naam = source.zoep;
    if (naam != nil) {
        [self.zoepers addObject:naam];
        [self.tableView reloadData];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // URL naar audiobestand aanmaken
    NSString *path = [NSString stringWithFormat:@"%@/bier.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    self.zoepers = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
     return [self.zoepers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Zoep *naam = [self.zoepers objectAtIndex:indexPath.row];
    cell.textLabel.text = naam.playername;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) loadInitialData
{
    // Add default names into app
    Zoep *naam1 = [[Zoep alloc] init];
    naam1.playername = @"Jules";
    [self.zoepers addObject:naam1];
    
    Zoep *naam2 = [[Zoep alloc] init];
    naam2.playername = @"Niels";
    [self.zoepers addObject:naam2];
    
    Zoep *naam3 = [[Zoep alloc] init];
    naam3.playername = @"Sem";
    [self.zoepers addObject:naam3];
}
- (IBAction)play:(id)sender {
    // Aantal namen ophalen die meedoen
    NSUInteger aantal = (unsigned long)[self.zoepers count];
   
    // Controle of er namen zijn opgegeven
    if(aantal <= 1)
    {
        // Geen namen opgegeven, dus een bericht tonen
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Als je geen namen hebt opgegeven kun je het spel ook niet starten slimmerik!\n\nOhja, je moet er minimaal 2 opgeven ;)" delegate:nil cancelButtonTitle:@"Wat ben ik toch stom" otherButtonTitles:@"Klopt", nil];
        
        [bericht show];
    }
    else
    {
        // Er zijn namen opgegeven, dus spel starten
        
        //Willekeurig getal kiezen
        willekeurig = arc4random()%aantal;
    
        Zoep *player = (Zoep *)[self.zoepers objectAtIndex:willekeurig];
    
        // Alert tonen met de gelukkige winnaar
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"En de winnaar is..." message:[ NSString stringWithFormat:@"\n%@,\njij bent de winnaar!",player.playername] delegate:nil cancelButtonTitle:@"Gesnopen" otherButtonTitles:nil, nil];
        [audioPlayer play];
    
        [bericht show];
    }
}
- (IBAction)RemoveNames:(id)sender {
    NSUInteger aantal = (unsigned long)[self.zoepers count];
    
    if(aantal == 0)
    {
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Uhh.." message:@"Er valt niet veel te verwijderen als er geen zoepers zijn..." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [bericht show];
        
    }
    else{
        [self.zoepers removeAllObjects];
        [self.tableView reloadData];
        UIAlertView *bericht = [[UIAlertView alloc] initWithTitle:@"Reset Zoepers" message:@"Alle zoepers zijn verwijderd!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
        [bericht show];
    }
}

@end

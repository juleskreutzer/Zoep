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

@interface ZoepTableViewController ()

@property NSMutableArray *zoepers;

@end

@implementation ZoepTableViewController

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

@end

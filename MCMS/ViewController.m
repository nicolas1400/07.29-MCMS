//
//  ViewController.m
//  MCMS
//
//  Created by Nicolas Semenas on 29/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UITextField *myDescriptionField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //PRE-FILL WITH SOME CREATURES
    
     MagicalCreature *creature1 = [[MagicalCreature alloc]init];
     creature1.name = @"name1";
     creature1.description = @"description1";
     creature1.image = [UIImage imageNamed:@"1"];

    
     MagicalCreature *creature2 = [[MagicalCreature alloc]init];
     creature2.name = @"name2";
     creature2.description = @"description2";
     creature2.image = [UIImage imageNamed:@"2"];



     MagicalCreature *creature3 = [[MagicalCreature alloc]init];
     creature3.name = @"name3";
     creature3.description = @"description3";
     creature3.image = [UIImage imageNamed:@"3"];

   
     self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3, nil];
     
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self.myTableView reloadData];
}

- (IBAction)onAdd:(id)sender {
    
    MagicalCreature *creature = [[MagicalCreature alloc]init];
    
    creature.name = self.myTextField.text;
    creature.description = self.myDescriptionField.text;
    
    [self.creatures addObject:creature];

    [self.myTableView reloadData];
    
    self.myTextField.text=@"";
    self.myDescriptionField.text=@"";

    [self.myTextField resignFirstResponder];
    [self.myDescriptionField resignFirstResponder];
    
    
    
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowCreatureSegue"])
    {
        DetailViewController *detailViewController =
        [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.myTableView
                                    indexPathForSelectedRow];
        
        long row = [myIndexPath row];
        
        detailViewController.thisCreature = [self.creatures objectAtIndex:row];
    }
}


#pragma mark - TableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    MagicalCreature * creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    cell.imageView.image = creature.image;
    return cell;
}


@end

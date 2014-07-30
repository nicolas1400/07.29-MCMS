//
//  DetailViewController.m
//  MCMS
//
//  Created by Nicolas Semenas on 29/07/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *detailDescription;

@property (weak, nonatomic) IBOutlet UITextField *editName;
@property (weak, nonatomic) IBOutlet UITextField *editDescription;

@property (nonatomic, assign) BOOL editMode;

@end

@implementation DetailViewController


- (IBAction)onEdit:(UIButton *)sender {
    
    [self.editName resignFirstResponder];
    [self.editDescription resignFirstResponder];
    
    
    if (self.editMode) {
        self.editMode = NO;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.editName.hidden = YES;
        self.editDescription.hidden = YES;
        
       // SAVE DATA IN THISCREATURE OBJECT
        self.thisCreature.name = self.editName.text;
        self.thisCreature.description = self.editDescription.text;
        
        //UPDATE LABELS
        self.detailName.text = self.thisCreature.name;
        self.detailDescription.text = self.thisCreature.description;
        
    }
    else {
        self.editMode = YES;
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.editName.hidden = NO;
        self.editDescription.hidden = NO;
    }
    
}
    



- (void)viewDidLoad
{
    self.editMode=NO;

    [super viewDidLoad];
    self.detailName.text = self.thisCreature.name;
    self.detailDescription.text = self.thisCreature.description;
    
    self.editName.hidden = YES;
    self.editDescription.hidden = YES;
    
    self.editName.text = self.thisCreature.name;
    self.editDescription.text = self.thisCreature.description;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@end

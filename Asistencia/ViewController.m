//
//  ViewController.m
//  Asistencia
//
//  Created by Rogelio Escalante on 19/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "ViewController.h"
#import "TableProyectos.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"admin"]) {
        UINavigationController *nav = [segue destinationViewController];
        TableProyectos *tableProyectos = (TableProyectos*)nav.topViewController;
        
    }
}

- (IBAction)iniciarSesion:(id)sender {
   
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    
    [query whereKey:@"username" equalTo:self.userTF.text];
    [query whereKey:@"password" equalTo:self.psswdTF.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.;
            if(!objects.count==0){
                [self performSegueWithIdentifier:@"admin" sender:self];}
            // Do something with the found objects
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    if ([self.userTF.text isEqualToString:@"user"] && [self.psswdTF.text isEqualToString:@"user"]) {
        [self performSegueWithIdentifier:@"user" sender:self];
    }
}
@end

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
        [tableProyectos setStringBienvenida:self.userTF.text];
    }
    if ([[segue identifier] isEqualToString:@"staff"]) {
        UINavigationController *nav = [segue destinationViewController];
        TableProyectos *tableProyectos = (TableProyectos*)nav.topViewController;
        [tableProyectos setUsuarioS:self.userTipo];
    }
}

- (IBAction)iniciarSesion:(id)sender {
   
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    
    [query whereKey:@"username" equalTo:self.userTF.text];
    [query whereKey:@"password" equalTo:self.psswdTF.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
      
       
        if (!error) {
            // The find succeeded.;
            
            
            
            for (PFObject *usuarioF in objects) {
                NSString *sNombre = usuarioF[@"nombre"] ;
                if ([sNombre isEqual: @"Staff"]) {
                    self.userTipo = usuarioF;
                    [self performSegueWithIdentifier:@"staff" sender:self];
                }
                else if([sNombre isEqual: @"Administrador"]){

                    [self performSegueWithIdentifier:@"admin" sender:self];
                
                }}
            }
            
            
        
               
            // Do something with the found objects
        else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}
@end

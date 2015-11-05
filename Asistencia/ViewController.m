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
    PFObject *admin1= [PFObject objectWithClassName:@"Rogelio"];
    admin1[@"username"] = @"adminMaster";
    admin1[@"password"] = @"MasterAdmin";
    PFObject *alumno1= [PFObject objectWithClassName:@"Andres"];
    alumno1[@"username"] = @"alumno1";
    alumno1[@"password"] = @"alumno1";
    self.listaUsuarios= [[NSArray alloc] initWithObjects:admin1, alumno1, nil];
    PFObject *listaUsers= [PFObject objectWithClassName:@"Usuarios"];
    listaUsers[@"lista"] = self.listaUsuarios;
    
    
    [listaUsers saveInBackground];
    // Do any additional setup after loading the view, typically from a nib.
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
}

- (IBAction)iniciarSesion:(id)sender {
    //Query que obtiene de DB el usuario y contraseña
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query getObjectInBackgroundWithId:@"gM9vddWj5P" block:^(PFObject *tmp, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        self.listaObtenida = tmp[@"lista"];
        self.userAtIndex = [self.listaObtenida objectAtIndex:0];
        self.stringUsername = self.userAtIndex[@"username"];
        self.stringPassword = self.userAtIndex[@"password"];
        //NSLog(@"%@", gameScore);
    }];
    if ([self.userTF.text isEqualToString: self.stringUsername] && [self.psswdTF.text isEqualToString:self.stringPassword]) {
        [self performSegueWithIdentifier:@"admin" sender:self];
    }
    if ([self.userTF.text isEqualToString:@"user"] && [self.psswdTF.text isEqualToString:@"user"]) {
        [self performSegueWithIdentifier:@"user" sender:self];
    }
}
@end

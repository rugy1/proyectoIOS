//
//  ViewController.h
//  Asistencia
//
//  Created by Rogelio Escalante on 19/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userTF;
@property (weak, nonatomic) IBOutlet UITextField *psswdTF;
- (IBAction)iniciarSesion:(id)sender;

@property (strong, nonatomic) NSArray *listaUsuarios;
@property (strong, nonatomic) NSArray *listaObtenida;
@property (nonatomic, strong) NSString* stringUsername;
@property (nonatomic, strong) NSString* stringPassword;
@property (nonatomic, strong) PFObject* userAtIndex;
@property (nonatomic, strong) PFObject* userTipo;


@end


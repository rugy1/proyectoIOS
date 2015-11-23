//
//  TableProyectos.h
//  Asistencia
//
//  Created by Rogelio Escalante on 19/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TableProyectos : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *labelBienvenida;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *suma;
@property (nonatomic, strong) NSString* stringBienvenida;
@property (nonatomic, strong) NSString* stringNewProject;
@property NSInteger numberRow;
@property (strong, nonatomic) NSArray *objetoListaAlumnos;
@property (strong, nonatomic) NSArray *objetoListaBeneficiarios;
@property (strong, nonatomic)PFObject *usuarioS;

@end

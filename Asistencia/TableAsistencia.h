//
//  TableAsistencia.h
//  Asistencia
//
//  Created by Rogelio Escalante on 22/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TableAsistencia : UITableViewController

@property (strong, nonatomic) NSArray *listaAsistenciaAlumnos;
@property (strong, nonatomic) NSArray *listaAsistenciaBeneficiarios;

@property (nonatomic, strong) NSString* stringAsistenciaProyecto;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saving;





@end

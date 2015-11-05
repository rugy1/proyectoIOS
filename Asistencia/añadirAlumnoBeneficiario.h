//
//  añadirAlumnoBeneficiario.h
//  Asistencia
//
//  Created by Rogelio Escalante on 04/11/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface an_adirAlumnoBeneficiario : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nombreAlumno;
@property (weak, nonatomic) IBOutlet UITextField *tipoAlumno;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saving;

@property NSArray *alumnos;
@property NSArray *beneficiarios;


@end

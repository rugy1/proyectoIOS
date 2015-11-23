//
//  añadirAlumnoBeneficiario.h
//  Asistencia
//
//  Created by Rogelio Escalante on 04/11/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface an_adirAlumnoBeneficiario : UIViewController

<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (IBAction)segmentedAction:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedStaffBen;
@property (weak, nonatomic) IBOutlet UILabel *apellidoAlumno;
@property (weak, nonatomic) IBOutlet UILabel *matriculaAlumno;
@property (weak, nonatomic) IBOutlet UITextField *tfNombre;
@property (weak, nonatomic) IBOutlet UITextField *tfApellido;
@property (weak, nonatomic) IBOutlet UITextField *tfMatricula;

@property (weak, nonatomic) IBOutlet UITextField *nombreAlumno;
@property (weak, nonatomic) IBOutlet UITextField *tipoAlumno;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saving;
@property (nonatomic, strong) NSString* stringAsistenciaProyecto;

@property NSArray *alumnos;
@property NSArray *beneficiarios;
@property (weak, nonatomic) IBOutlet UIImageView *fotoAlumno;

- (IBAction)foto:(id)sender;

@end

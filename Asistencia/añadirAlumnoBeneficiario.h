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

@property (weak, nonatomic) IBOutlet UITextField *nombreAlumno;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipoAlumno;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saving;
@property (nonatomic, strong) NSString *stringAsistenciaProyecto;

@property NSArray *alumnos;
@property NSArray *beneficiarios;
@property (weak, nonatomic) IBOutlet UIImageView *fotoAlumno;

- (IBAction)foto:(id)sender;

@end

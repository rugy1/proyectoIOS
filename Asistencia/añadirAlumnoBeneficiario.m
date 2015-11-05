//
//  añadirAlumnoBeneficiario.m
//  Asistencia
//
//  Created by Rogelio Escalante on 04/11/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "añadirAlumnoBeneficiario.h"
#import "TableAsistencia.h"

@interface an_adirAlumnoBeneficiario ()

@end

@implementation an_adirAlumnoBeneficiario

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"añadiendo alumno";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender == self.saving) {
        if ([self.tipoAlumno.text isEqualToString:@"Alumno"]) {
            self.alumnos = [self.alumnos arrayByAddingObject:self.nombreAlumno.text];
            [[segue destinationViewController] setListaAsistenciaAlumnos:self.alumnos];
        }
        else if([self.tipoAlumno.text isEqualToString:@"Beneficiario"]){
            self.beneficiarios = [self.beneficiarios arrayByAddingObject:self.nombreAlumno.text];
            [[segue destinationViewController] setListaAsistenciaBeneficiarios:self.beneficiarios];
        }
    }
}

@end

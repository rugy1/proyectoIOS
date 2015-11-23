//
//  Proyectos.m
//  Asistencia
//
//  Created by Rogelio Escalante on 22/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "Proyectos.h"

@implementation Proyectos

- (id) initWithNombreProyecto:(NSString *)nom nombreEspacio:(NSString *)esp alumnosEncargados:(NSArray *)alumnos beneficiarios:(NSArray *)beneficiarios{
    
    self = [super init];
    if(self){
        _nombreProyecto = nom;
        _nombreEspacio = esp;
        _alumnosEncargados = alumnos;
        _beneficiarios = beneficiarios;
    }
    
    return self;
    
}


@end

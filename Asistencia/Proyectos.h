//
//  Proyectos.h
//  Asistencia
//
//  Created by Rogelio Escalante on 22/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Proyectos : NSObject

@property(nonatomic, strong) NSString *nombreProyecto;
@property(nonatomic, strong) NSArray *alumnosEncargados;
@property(nonatomic, strong) NSString *nombreEspacio;
@property NSArray *beneficiarios;

- (id) initWithNombreProyecto: (NSString *) nom
                nombreEspacio:(NSString *) esp
            alumnosEncargados: (NSArray *) alumnos
            beneficiarios: (NSArray *) beneficiarios;

@end

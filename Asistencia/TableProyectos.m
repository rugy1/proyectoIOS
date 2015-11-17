//
//  TableProyectos.m
//  Asistencia
//
//  Created by Rogelio Escalante on 19/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "TableProyectos.h"
#import "Proyectos.h"
#import "TableAsistencia.h"

@interface TableProyectos ()

@property NSMutableArray *objects;
@property NSMutableArray *listaProyectos;
@property NSArray *alumnosCaracol;
@property NSArray *alumnosEstrella;
@property NSArray *benefCaracol;
@property NSArray *benefEstrella;
@property NSArray *vacioAlumnos;
@property NSArray *vacioBenef;


@end

@implementation TableProyectos

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelBienvenida.text = self.stringBienvenida;
    self.tableView.tableHeaderView = self.labelBienvenida;
    
    
   /* self.alumnosCaracol = [[NSArray alloc] initWithObjects:@"Rogelio", @"Andres", nil];
    self.alumnosEstrella = [[NSArray alloc] initWithObjects:@"Luis", @"Fernando", nil];
    self.benefCaracol = [[NSArray alloc] initWithObjects:@"Maria", @"Pedro", nil];
    self.benefEstrella = [[NSArray alloc] initWithObjects:@"Ramon", @"Gaby", nil];*/

    self.vacioAlumnos = [[NSArray alloc] initWithObjects:nil];
    self.vacioBenef = [[NSArray alloc] initWithObjects:nil];
    Proyectos *proyecto1 = [[Proyectos alloc] initWithNombreProyecto:@"Caracol" alumnosEncargados:self.vacioAlumnos beneficiarios:self.vacioBenef];
    Proyectos *proyecto2 = [[Proyectos alloc] initWithNombreProyecto:@"Estrella" alumnosEncargados:self.vacioAlumnos beneficiarios:self.vacioBenef];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.listaProyectos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celda" forIndexPath:indexPath];
    
    Proyectos *object = self.listaProyectos[indexPath.row];
    cell.textLabel.text = [object nombreProyecto];
    return cell;
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showProyecto"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Proyectos *proyect = self.listaProyectos[indexPath.row];
        [[segue destinationViewController] setListaAsistenciaAlumnos:[proyect alumnosEncargados]];
        [[segue destinationViewController] setListaAsistenciaBeneficiarios:[proyect beneficiarios]];
        [[segue destinationViewController] setStringAsistenciaProyecto:[proyect nombreProyecto]];
        self.numberRow = indexPath.row;
    }
}

- (IBAction)unwindTableAsistencia:(UIStoryboardSegue *) segue{
    Proyectos *proyectModified = self.listaProyectos[self.numberRow];
    [proyectModified setAlumnosEncargados:self.objetoListaAlumnos];
    [proyectModified setBeneficiarios:self.objetoListaBeneficiarios];
    
    //Actualizar y notificar guardado de asistencia///////////////////////
}

- (IBAction)unwindAñadirProyecto:(UIStoryboardSegue *) segue{
    Proyectos *project = [[Proyectos alloc] initWithNombreProyecto:self.stringNewProject alumnosEncargados:self.vacioAlumnos beneficiarios:self.vacioBenef];
    [self.listaProyectos addObject:project];
    [self.tableView reloadData];
}

@end

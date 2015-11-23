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
@property BOOL stafBool;
//

@end

@implementation TableProyectos

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelBienvenida.text = self.stringBienvenida;
    self.tableView.tableHeaderView = self.labelBienvenida;
    
    
   
    
    self.vacioAlumnos = [[NSArray alloc] initWithObjects:nil];
    self.vacioBenef = [[NSArray alloc] initWithObjects:nil];
    self.listaProyectos = [NSMutableArray array];
    
   
    
    
    if(self.usuarioS!=nil){
        _stafBool = YES;
        self.navigationItem.rightBarButtonItem.enabled = NO;
        NSString *oid = self.usuarioS[@"password"];
        PFQuery *query = [PFQuery queryWithClassName:@"Staff"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *proy, NSError *error) {
            if (!error) {
                
                // Do something with the found objects
                for (PFObject *object in proy) {
                    NSLog(@"%@", object.objectId);
                    
                    NSString *nombreP = object[@"proyecto"];
                    NSString *nombreE = object[@"Espacio"];
                    NSString *objP = object[@"matricula"];
                    
                    if(objP == oid){
                        Proyectos *proy1 = [[Proyectos alloc] initWithNombreProyecto:nombreP nombreEspacio:nombreE alumnosEncargados:self.vacioAlumnos beneficiarios:self.vacioBenef];
                    
                        [self.listaProyectos  addObject:proy1];}
                }
                [self.tableView reloadData];
                
                
            } else {
                // Log details of the failure
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
        
    }
    

    if(self.usuarioS==nil){
    PFQuery *query = [PFQuery queryWithClassName:@"Proyecto"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *proy, NSError *error) {
        if (!error) {

            // Do something with the found objects
            for (PFObject *object in proy) {
                NSLog(@"%@", object.objectId);
                
                NSString *nombreP = object[@"nombre"];
                NSString *nombreE = object[@"Espacio"];

                NSLog(@"%@",nombreP);
                
                Proyectos *proy1 = [[Proyectos alloc] initWithNombreProyecto:nombreP nombreEspacio:nombreE alumnosEncargados:self.vacioAlumnos beneficiarios:self.vacioBenef];
                
                [self.listaProyectos  addObject:proy1];
            }
            [self.tableView reloadData];
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    }
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
    if(_stafBool == YES){
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celda" forIndexPath:indexPath];
    Proyectos *object = self.listaProyectos[indexPath.row];
    cell.textLabel.text = [object nombreProyecto];
      cell.detailTextLabel.text = [object nombreEspacio];
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
    if(_stafBool == YES){
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    Proyectos *proyectModified = self.listaProyectos[self.numberRow];
    [proyectModified setAlumnosEncargados:self.objetoListaAlumnos];
    [proyectModified setBeneficiarios:self.objetoListaBeneficiarios];
    
    //Actualizar y notificar guardado de asistencia///////////////////////
}

- (IBAction)unwindAñadirProyecto:(UIStoryboardSegue *) segue{
    if(_stafBool == YES){
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    Proyectos *project = [[Proyectos alloc] initWithNombreProyecto:self.stringNewProject nombreEspacio:self.stringNewProject alumnosEncargados:self.vacioAlumnos beneficiarios:self.vacioBenef];
    [self.listaProyectos addObject:project];
    [self.tableView reloadData];
}



@end

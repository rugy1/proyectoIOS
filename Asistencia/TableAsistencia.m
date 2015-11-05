//
//  TableAsistencia.m
//  Asistencia
//
//  Created by Rogelio Escalante on 22/10/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "TableAsistencia.h"
#import "TableProyectos.h"
#import "Proyectos.h"
#import "añadirAlumnoBeneficiario.h"

@interface TableAsistencia ()

@end

@implementation TableAsistencia

- (void)setListaAsistencia:(NSArray *)newListaAsistencia{
    if (_listaAsistencia != newListaAsistencia) {
        _listaAsistencia = newListaAsistencia;
        
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.stringAsistenciaProyecto;

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
    return self.listaAsistencia.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *tableCell = [tableView cellForRowAtIndexPath:indexPath];
    BOOL isSelected = (tableCell.accessoryType == UITableViewCellAccessoryCheckmark);
    
    if (isSelected) {
        tableCell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        tableCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaAsistencia" forIndexPath:indexPath];
    
    NSString *persona = self.listaAsistencia[indexPath.row];
    cell.textLabel.text = [persona description];

    return cell;
}


#pragma mark - Navigation

 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([[segue identifier] isEqualToString:@"añadiendo"]) {
         [[segue destinationViewController] setStringAsistenciaProyecto:self.title];
         [[segue destinationViewController] setAlumnos:self.listaAsistenciaAlumnos];
         [[segue destinationViewController] setBeneficiarios:self.listaAsistenciaBeneficiarios];
         //[[segue destinationViewController] setStringAsistenciaProyecto:[proyect nombreProyecto]];
     }
     if (sender == self.saving) {
         [[segue destinationViewController] setObjetoListaAlumnos:self.listaAsistenciaAlumnos];
         [[segue destinationViewController] setObjetoListaBeneficiarios:self.listaAsistenciaBeneficiarios];
     }
 }

- (IBAction)unwindAñadirAlumnoBeneficiario:(UIStoryboardSegue *) segue{
    self.listaAsistencia = self.listaAsistenciaAlumnos;
    self.listaAsistencia = [self.listaAsistencia arrayByAddingObjectsFromArray:self.listaAsistenciaBeneficiarios];
    [self.tableView reloadData];
}

@end

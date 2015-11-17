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
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0)
    {
        return [self.listaAsistenciaAlumnos count];
    }
    else{
        return [self.listaAsistenciaBeneficiarios count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0){
        if ([self.listaAsistenciaAlumnos count]==0) {
            return nil;
        }
        else return @"Alumnos";
    }
    else{
        if ([self.listaAsistenciaBeneficiarios count]==0) {
            return nil;
        }
        else return @"Beneficiarios";
    }
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

    if (indexPath.section==0) {
        NSString *theCellData = [self.listaAsistenciaAlumnos objectAtIndex:indexPath.row];
        cell.textLabel.text = [theCellData description];
    }
    else {
        NSString *theCellData2 = [self.listaAsistenciaBeneficiarios objectAtIndex:indexPath.row];
        cell.textLabel.text = [theCellData2 description];
    }
    return cell;
}


#pragma mark - Navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([[segue identifier] isEqualToString:@"añadiendo"]) {
         [[segue destinationViewController] setStringAsistenciaProyecto:self.title];
         [[segue destinationViewController] setAlumnos:self.listaAsistenciaAlumnos];
         [[segue destinationViewController] setBeneficiarios:self.listaAsistenciaBeneficiarios];
     }
     if (sender == self.saving) {
         [[segue destinationViewController] setObjetoListaAlumnos:self.listaAsistenciaAlumnos];
         [[segue destinationViewController] setObjetoListaBeneficiarios:self.listaAsistenciaBeneficiarios];
     }
 }

- (IBAction)unwindAñadirAlumnoBeneficiario:(UIStoryboardSegue *) segue{
    [self.tableView reloadData];
}

@end

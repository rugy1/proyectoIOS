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
        
        // Update the view.
       // [self configureView];
    }
}
/*
- (void)configureView {
    // Update the user interface for the detail item.
    if (self.listaAsistencia) {
        Proyectos *proyect = self.listaAsistencia;
        self.detailDescriptionLabel.numberOfLines = 3;
        NSString *str = [[NSString alloc] initWithFormat:@"%@ \n%@ \n%d", [contact nombre], [contact oficina], [contact telefono]];
        self.detailDescriptionLabel.text = str;
        
        self.listaAsistencia =
        
    }
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.stringAsistenciaProyecto;
    //self.labelAsistencia.text = self.stringAsistenciaProyecto;
    //UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(guardado)];
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(adding)];
    
    //self.navigationItem.rightBarButtonItem = saveButton;
    //self.navigationItem.rightBarButtonItem = addButton;

    
   // self.tableView.tableFooterView = self.buttonSaving;
}

/*- (void)adding{
    //[[self navigationController] popViewControllerAnimated:YES];
    
}

- (void)guardado{
    [[self navigationController] popViewControllerAnimated:YES];
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
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

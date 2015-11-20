//
//  TableEspacios.m
//  Asistencia
//
//  Created by Rogelio Escalante on 11/11/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "TableEspacios.h"

@interface TableEspacios ()

@property NSArray *listaEspaciosVacios;
@property NSArray *listaProyectosVacios;

@end

@implementation TableEspacios

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Espacios";
    
    self.listaProyectosVacios = [[NSArray alloc] initWithObjects:nil];
    self.listaEspaciosVacios = [[NSArray alloc] initWithObjects:nil];
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
    return self.listaEspaciosVacios.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellEspacio" forIndexPath:indexPath];
    NSString *espacio = self.listaEspaciosVacios[indexPath.row];
    cell.textLabel.text = espacio;
    

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)unwindAñadirEspacio:(UIStoryboardSegue *) segue{
    /*Proyectos *project = [[Proyectos alloc] initWithNombreProyecto:self.stringNewProject alumnosEncargados:self.vacioAlumnos beneficiarios:self.vacioBenef];*/
    self.listaEspaciosVacios=[self.listaEspaciosVacios arrayByAddingObject:self.stringNewEspacio];
    [self.tableView reloadData];
}


@end

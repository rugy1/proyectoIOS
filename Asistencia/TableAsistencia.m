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
@property NSMutableArray *listaBeneficiario;
@property NSMutableArray *listaStaff;

@end

@implementation TableAsistencia


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.stringAsistenciaProyecto;
    //
    self.listaBeneficiario= [NSMutableArray array];
      self.listaStaff= [NSMutableArray array];
    
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd.MM.YY"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    self.fechaAsistencia.title = dateString;
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"Beneficiario"];
    [query whereKey:@"proyecto" equalTo:self.stringAsistenciaProyecto];
    [query findObjectsInBackgroundWithBlock:^(NSArray *benef, NSError *error) {
        if (!error) {
            
            // Do something with the found objects
            for (PFObject *object in benef) {
                 NSString *bId = object.objectId;
                
                PFQuery *query4 = [PFQuery queryWithClassName:@"Beneficiario"];
                
                // Retrieve the object by id
                [query4 getObjectInBackgroundWithId:bId
                                              block:^(PFObject *benef, NSError *error) {
                                                  benef[@"presente"] = @NO;
                                                  [benef saveInBackground];
                                              }];
                
                
                
                [self.listaBeneficiario  addObject:object];
            }
            [self.tableView reloadData];
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    PFQuery *query2 = [PFQuery queryWithClassName:@"Staff"];
    [query2 whereKey:@"proyecto" equalTo:self.stringAsistenciaProyecto];
    [query2 findObjectsInBackgroundWithBlock:^(NSArray *staff, NSError *error) {
        if (!error) {
            
            // Do something with the found objects
            for (PFObject *object in staff) {
                
                NSString *sId = object.objectId;
               
                PFQuery *query3 = [PFQuery queryWithClassName:@"Staff"];
                
                // Retrieve the object by id
                [query3 getObjectInBackgroundWithId:sId
                block:^(PFObject *stafff, NSError *error) {
                stafff[@"presente"] = @NO;
                [stafff saveInBackground];
                                              }];
                
                
                
                [self.listaStaff  addObject:object];
            }
            [self.tableView reloadData];
            
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    
    
    [self.tableView reloadData];
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
        return [self.listaStaff count];
    }
    else{
        return ([self.listaBeneficiario count]);
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0){
        if ([self.listaStaff count]==0) {
            return nil;
        }
        else return @"Alumnos";
    }
    else{
        if ([self.listaBeneficiario count]==0) {
            return nil;
        }
        else return @"Beneficiarios";
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *tableCell = [tableView cellForRowAtIndexPath:indexPath];
    BOOL isSelected = (tableCell.accessoryType == UITableViewCellAccessoryCheckmark);
    NSString *sId, *bId;
    
    if(indexPath.section == 0){
    
        PFObject *theCellData3 = [self.listaStaff objectAtIndex:indexPath.row];
        sId = theCellData3.objectId;
    }else{
    
        PFObject *theCellData2 = [self.listaBeneficiario objectAtIndex:indexPath.row];
        bId = theCellData2.objectId;
        

    }
    


    
    
    if (isSelected) {
        
        
        
        tableCell.accessoryType = UITableViewCellAccessoryNone;
        
        if(indexPath.section == 0){
            
            PFQuery *query2 = [PFQuery queryWithClassName:@"Staff"];
            
            // Retrieve the object by id
            [query2 getObjectInBackgroundWithId:sId
                                          block:^(PFObject *stafff, NSError *error) {
                                              stafff[@"presente"] = @NO;
                                              [stafff saveInBackground];
                                          }];
            
           
        }else{
            PFQuery *query = [PFQuery queryWithClassName:@"Beneficiario"];
            // Retrieve the object by id
            [query getObjectInBackgroundWithId:bId
                                         block:^(PFObject *benef, NSError *error) {
                                             benef[@"presente"] = @NO;
                                             [benef saveInBackground];
                                         }];
            
        }
      
        


        

    }
    else {
        tableCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        
        if(indexPath.section == 0){
            
            PFQuery *query2 = [PFQuery queryWithClassName:@"Staff"];
            
            // Retrieve the object by id
            [query2 getObjectInBackgroundWithId:sId
                                          block:^(PFObject *stafff, NSError *error) {
                                              stafff[@"presente"] = @YES;
                                              [stafff saveInBackground];
                                          }];
            
            
            
        }else{
            
            PFQuery *query = [PFQuery queryWithClassName:@"Beneficiario"];
            
            // Retrieve the object by id
            [query getObjectInBackgroundWithId:bId
                                         block:^(PFObject *benef, NSError *error) {
                                             benef[@"presente"] = @YES;
                                             [benef saveInBackground];
                                         }];
            
            
        }
        
        
        
     
        
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celdaAsistencia" forIndexPath:indexPath];

    if (indexPath.section==0) {
        PFObject *theCellData = [self.listaStaff objectAtIndex:indexPath.row];
        NSString *sname = theCellData[@"nombre"];
        cell.textLabel.text = sname;
    }
    else {
       PFObject *theCellData2 = [self.listaBeneficiario objectAtIndex:indexPath.row];
        NSString *bname = theCellData2[@"nombre"];
        cell.textLabel.text = bname;
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

- (IBAction)guardarAsistencia:(id)sender {
    
   
    for (int i=0; i<self.listaBeneficiario.count; i++) {
        
        PFObject *theCellData2 = [self.listaBeneficiario objectAtIndex:i];
        NSNumber *bFaltas = theCellData2[@"faltas"];
        NSString *bId = theCellData2.objectId;
        
        
        
        PFQuery *query = [PFQuery queryWithClassName:@"Beneficiario"];
        
        
        [query getObjectInBackgroundWithId:bId
        block:^(PFObject *benef, NSError *error) {
                                         if([benef[@"presente"] isEqual:@YES]){
                                             benef[@"faltas"] = bFaltas;}
                                         else{
                                             NSInteger newRow = [bFaltas integerValue];
                                             newRow++;
                                             NSNumber *myNum = [NSNumber numberWithInteger:newRow];
                                             [benef[@"fechas"]addObject:self.fechaAsistencia.title];
                                             benef[@"faltas"] = myNum;
                                             newRow=0;
                                         }
                                         [benef saveInBackground];
                                     }];


        
    }
    
    
    
    for (int i=0; i<self.listaStaff.count; i++) {
        
        PFObject *theCellData2 = [self.listaStaff objectAtIndex:i];
        NSNumber *bFaltas = theCellData2[@"faltas"];
        NSString *bId = theCellData2.objectId;
        
        
        
        PFQuery *query2 = [PFQuery queryWithClassName:@"Staff"];
        
        
        [query2 getObjectInBackgroundWithId:bId
                                     block:^(PFObject *staff, NSError *error) {
                                         if([staff[@"presente"] isEqual:@YES]){
                                             staff[@"faltas"] = bFaltas;}
                                         else{
                                             NSInteger newRow = [bFaltas integerValue];
                                             newRow++;
                                             NSNumber *myNum = [NSNumber numberWithInteger:newRow];
                                             [staff[@"fechas"]addObject:self.fechaAsistencia.title];
                                             staff[@"faltas"] = myNum;
                                             newRow=0;
                                         }
                                         [staff saveInBackground];
                                     }];
        
        
        
    }
    [self performSegueWithIdentifier:@"regresar2" sender:self];
    
        


    
    
}
@end

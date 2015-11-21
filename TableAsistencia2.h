//
//  TableAsistencia2.h
//  Asistencia
//
//  Created by Rogelio Escalante on 20/11/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface TableAsistencia2 : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *listaAsistenciaAlumnos;
@property (strong, nonatomic) NSArray *listaAsistenciaBeneficiarios;
@property (nonatomic, strong) NSString* stringAsistenciaProyecto;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saving;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

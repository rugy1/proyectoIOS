//
//  añadirEspacio.m
//  Asistencia
//
//  Created by Rogelio Escalante on 18/11/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "añadirEspacio.h"
#import "TableEspacios.h"

@interface an_adirEspacio ()

@end

@implementation an_adirEspacio

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[segue destinationViewController] setStringNewEspacio:self.nombreEspacio.text];
    PFObject *nuevo = [PFObject objectWithClassName:@"Espacio"];
    nuevo[@"nombre"] = self.nombreEspacio.text;
    [nuevo saveInBackground];
}

@end

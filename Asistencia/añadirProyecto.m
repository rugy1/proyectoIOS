//
//  añadirProyecto.m
//  Asistencia
//
//  Created by Rogelio Escalante on 04/11/15.
//  Copyright (c) 2015 Rogelio Escalante. All rights reserved.
//

#import "añadirProyecto.h"
#import "TableProyectos.h"

@interface an_adirProyecto ()

@end

@implementation an_adirProyecto

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[segue destinationViewController] setStringNewProject:self.nombreProyecto.text];
    PFObject *nuevo = [PFObject objectWithClassName:@"Proyecto"];
    nuevo[@"nombre"] = self.nombreProyecto.text;
    [nuevo saveInBackground];
}


@end

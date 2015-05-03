//
//  SampleCPP.h
//  ObjectCPPSample
//
//  Created by Cheng-Lun Li on 5/3/15.
//  Copyright (c) 2015 Cheng-Lun Li. All rights reserved.
//

#ifndef __ObjectCPPSample__SampleCPP__
#define __ObjectCPPSample__SampleCPP__

#include <stdio.h>

#endif /* defined(__ObjectCPPSample__SampleCPP__) */

class CppClass {
public:
    int counter;

    CppClass(int arg1) {
        counter = arg1;
    }

    int whatsTheNumber (int number);
    
    // ...
private:
//    std::string _arg2;
};
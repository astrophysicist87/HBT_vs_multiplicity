#include<iostream>
#include<iomanip>
#include<fstream>
#include<string>
#include<sstream>
#include<math.h>
#include<sys/time.h>
#include<algorithm>

#include "ParameterReader.h"
#include "Arsenal.h"
#include "fit.h"

using namespace std;


int main(int argc, char *argv[])
{
	cout << endl << "********************************************************************************" << endl;
	cout << endl
		<< "            Correlation functions fitting            " << endl
		<< endl
		<< "  Ver 1.0   ----- Author: Christopher Plumberg   " << endl;
	cout << endl << "********************************************************************************" << endl << endl;
	
	// use log fit
	Get_GF_HBTradii( std::string(argv[1]), true );

	// use non-linear chi^2-minimization GSL fit
	Get_GF_HBTradii( std::string(argv[1]), false );

	return 0;
}

//End of file

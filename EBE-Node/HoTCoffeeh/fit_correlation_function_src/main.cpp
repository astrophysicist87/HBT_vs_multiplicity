#include <omp.h>
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
	cout << "**********************************************************" << endl;
	cout << endl
		<< "            Correlation functions with resonances            " << endl
		<< endl
		<< "  Ver 1.0   ----- Author: Christopher Plumberg   " << endl;
	cout << endl << "**********************************************************" << endl << endl;
	
	// Read-in parameters
	/*ParameterReader * paraRdr = new ParameterReader;
	paraRdr->readFromFile("parameters.dat");
	paraRdr->readFromArguments(argc, argv);
	paraRdr->echo();*/

	Read_in_correlationfunction("results/correlation_function_3D_Pion_+.dat");

	Get_GF_HBTradii();

	return 0;
}

//End of file

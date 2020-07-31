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
	
	Get_GF_HBTradii(argv[1]);

	return 0;
}

//End of file

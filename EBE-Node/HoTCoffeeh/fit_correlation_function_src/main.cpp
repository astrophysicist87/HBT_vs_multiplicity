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

vector<double> KT_pts, Kphi_pts, qx_pts, qy_pts, qz_pts;
vector<vector<double> > CFvals;

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

	KT_pts = vector<double>(n_KT_pts);
	Kphi_pts = vector<double>(n_Kphi_pts);
	qx_pts = vector<double>(nqxpts);
	qy_pts = vector<double>(nqypts);
	qz_pts = vector<double>(nqzpts);

	CFvals = vector<vector<double> >( n_KT_pts * n_Kphi_pts, vector<double> ( nqxpts * nqypts * nqzpts, 0.0 ) );

	Read_in_correlationfunction("./results/correlfunct3D_Pion_+.dat");

	Get_GF_HBTradii();

	return 0;
}

//End of file

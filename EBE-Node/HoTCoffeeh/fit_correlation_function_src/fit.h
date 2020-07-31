#include<iostream>
#include<sstream>
#include<string>
#include<fstream>
#include<cmath>
#include<iomanip>
#include<vector>
#include<stdio.h>


#include "Arsenal.h"


struct Correlationfunction3D_data
{
	size_t data_length;
	vector<double> q_o;
	vector<double> q_s;
	vector<double> q_l;
	vector<double> y;
	vector<double> sigma;
};

int Fittarget_correlfun3D_f (const gsl_vector *xvec_ptr, void *params_ptr, gsl_vector *f_ptr);
int Fittarget_correlfun3D_df (const gsl_vector *xvec_ptr, void *params_ptr,  gsl_matrix *Jacobian_ptr);
int Fittarget_correlfun3D_fdf (const gsl_vector* xvec_ptr, void *params_ptr, gsl_vector* f_ptr, gsl_matrix* Jacobian_ptr);
int Fittarget_correlfun3D_f_withlambda (const gsl_vector *xvec_ptr, void *params_ptr, gsl_vector *f_ptr);
int Fittarget_correlfun3D_df_withlambda (const gsl_vector *xvec_ptr, void *params_ptr,	gsl_matrix *Jacobian_ptr);
int Fittarget_correlfun3D_fdf_withlambda (const gsl_vector* xvec_ptr, void *params_ptr, gsl_vector* f_ptr, gsl_matrix* Jacobian_ptr);

const bool USE_LAMBDA = true;

const int n_KT_pts = 15;
const int n_Kphi_pts = 36;
const int nqxpts = 7;
const int nqypts = 7;
const int nqzpts = 7;

inline int indexer_KT_Kphi( int iKT, int iKphi )
{
	return ( iKT * n_Kphi_pts + iKphi );
}

inline int indexer_qx_qy_qz( int iqx, int iqy, int iqz )
{
	return ( (iqx * nqypts + iqy) * nqzpts + iqz );
}

vector<double> KT_pts(n_KT_pts), KPhi_pts(n_Kphi_pts);
vector<double> qx_pts(nqxpts), qy_pts(nqypts), qz_pts(nqzpts);

vector<vector<double> > CFvals = vector<vector<double> >( n_KT_pts * n_Kphi_pts, vector<double> ( nqxpts * nqypts * nqzpts ) );


void Get_GF_HBTradii();
void Read_in_correlationfunction(string filename);
void Fit_Correlationfunction3D(vector<double> & Correl_3D, int iKT, int iKphi);
void Fit_Correlationfunction3D_withlambda(vector<double> & Correl_3D, int iKT, int iKphi);
int print_fit_state_3D (size_t iteration, gsl_multifit_fdfsolver * solver_ptr);
int print_fit_state_3D_withlambda (size_t iteration, gsl_multifit_fdfsolver * solver_ptr);
void find_minimum_chisq_correlationfunction_full(vector<double> & Correl_3D, int iKT, int iKphi);


// End of file

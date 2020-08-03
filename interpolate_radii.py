#!/usr/bin/env python
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import scipy.interpolate
#from scipy.interpolate import RegularGridInterpolator as rgi
import sys, os



#====================================================
if __name__ == "__main__":
	# Set KT and Kphi grids
	(KTpts, KTwts) = np.loadtxt('KT.dat').T
	(Kphipts, Kphiwts) = np.loadtxt('KPHI36.dat').T
	nKT = len(KTpts)
	nKphi = len(Kphipts)
	
	filename = sys.argv[1]
	R2ij = [ R2s, R2o, R2os, R2l, R2sl, R2ol ] \
		= [ radsq.reshape([nKT, nKphi]) for radsq in np.loadtxt(filename)[:,2:].T ]

	newKTpts = np.linspace(0.01, 1.01, 101)
	f = scipy.interpolate.interp1d(KTpts, R2ij, kind='cubic', axis=1)
	R2ij = np.dot( f(newKTpts), Kphiwts ) / (2.0*np.pi)
	
	# split it back up to save
	[ R2s, R2o, R2os, R2l, R2sl, R2ol ] = R2ij
	
	print R2s
	
	#outfilename = os.path.dirname(filename) + '/R2ij_GF_cfs.dat'
	#print('Saving to', outfilename)
	#np.savetxt( outfilename, np.c_[ newKTpts, 0, R2s, R2o, R2os, R2l, R2sl, R2ol ], fmt='%1.6f' )
	
	
	


# End of file

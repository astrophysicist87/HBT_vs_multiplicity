#!/usr/bin/env python
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import scipy.interpolate
from scipy.interpolate import RegularGridInterpolator as rgi
import sys, os


'''
GeVtoMeV = 1000.0
showInsteadOfSave = False


#====================================================
def simple_plot(ax, filename, xCol, yCol, **kwargs):
	dataset=np.loadtxt(filename)
	x, y = GeVtoMeV*dataset[:,xCol], dataset[:,yCol]
	xnew = np.linspace(np.min(x), np.max(x), 1000)
	f = scipy.interpolate.interp1d(x, y, kind='quadratic')
	ln, = ax.plot(xnew, f(xnew), **kwargs)
	return ln
'''



#====================================================
if __name__ == "__main__":
	# Set KT and Kphi grids
	(KTpts, KTwts) = np.loadtxt('KT.dat').T
	(Kphipts, Kphiwts) = np.loadtxt('Kphi.dat').T
	nKT = len(KTpts)
	nKphi = len(Kphipts)
	
	filename = sys.argv[1]
	SVs = [ S, xs, xo, xl, t, \
			xs_t, xo_t, xl_t, xo_xs, xl_xs, xo_xl, \
			xs2, xo2, xl2, t2 ] \
		= [ SV.reshape([nKT, nKphi]) for SV in np.loadtxt(filename)[:,2:].T ]

	SVs = np.asarray(SVs) / S

	newKTpts = np.linspace(0.01, 1.01, 101)
	f = scipy.interpolate.interp1d(KTpts, SVs, kind='cubic', axis=1)
	SVs = np.dot( f(newKTpts), Kphiwts ) / (2.0*np.pi)

	# split back up into individual source variances
	[ S, xs, xo, xl, t, \
		xs_t, xo_t, xl_t, xo_xs, xl_xs, xo_xl, \
		xs2, xo2, xl2, t2 ] = SVs

	outfilename = os.path.dirname(filename) + '/SV_cfs.dat'
	print 'Saving to', outfilename
	np.savetxt( outfilename, np.c_[ newKTpts, xs2 - xs**2, xo2 - xo**2, xo_t - xo*t, t2 - t**2, xl2 - xl**2 ], fmt='%1.6f' )
	
	
	


# End of file

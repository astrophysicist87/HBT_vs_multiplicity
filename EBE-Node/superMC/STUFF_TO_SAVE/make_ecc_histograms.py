#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt
import sys

filename = sys.argv[1]

data=np.loadtxt(filename)
'''
data=data[np.where((data[:,-1] >= 3.0) & (data[:,-1] <= 4.0))]

data=data[np.where((np.abs(data[:,2]) <= 0.2) & (np.abs(data[:,3]) <= 0.2))]

nbins=100
H, xedges, yedges = np.histogram2d(data[:,3], data[:,2], bins=nbins)

cm = plt.cm.gnuplot
#plt.imshow(H, cmap=cm, vmin=0.0, vmax=0.2, origin='lower', interpolation='bicubic',\
#		extent=[xedges.min()-1, xedges.max()+1, yedges.min()-1, yedges.max()+1])

plt.imshow(H, cmap=cm, origin='lower', interpolation='none')

plt.show()
'''

'''
# use this range of impact parameter b
#data=data[np.where((data[:,-1] >= 3.0) & (data[:,-1] <= 4.0))]

dataToPlot = np.arctan2(data[:,1], data[:,0])
#dataToPlot = np.sqrt(data[:,3]**2+data[:,2]**2)
#dataToPlot = np.arctan2(data[:,3], data[:,2])
dataToPlot[np.where(dataToPlot < 0.0)] += 2.0*np.pi

n, bins, patches = plt.hist(dataToPlot, 100, facecolor='g', alpha=0.75)

plt.show()
'''

nBins = 60
bmin, bmax = 0.0, 12.0
lls = np.linspace(bmin, bmax - 1.0/nBins, nBins)
uls = np.linspace(bmin + 1.0/nBins, bmax, nBins)
cs = 0.5 * ( lls + uls )
avgs = 0.0 * cs

for iBin in xrange(nBins):
	ll = lls[iBin]
	ul = uls[iBin]
	dataSlice = data[np.where((data[:,-1] >= ll) & (data[:,-1] <= ul))]
	avgs[iBin] = np.mean(np.sqrt(dataSlice[:,3]**2+dataSlice[:,2]**2))

fig, ax = plt.subplots()
ax.plot(cs, avgs)

#plt.axis([0, 10, 0, 0.5])

plt.show()


# End of file

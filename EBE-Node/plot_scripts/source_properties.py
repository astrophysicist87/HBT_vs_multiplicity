import sys
import numpy as np
import scipy.interpolate as interp
#import matplotlib
#import matplotlib.pyplot as plt

if __name__ == "__main__":
    workingDirectory   = sys.argv[1]
    (KTpts, KTwts)     = np.loadtxt(workingDirectory + '/KT.dat').T
    (KPHIpts, KPHIwts) = np.loadtxt(workingDirectory + '/KPHI.dat').T

    nMom     = 3
    nKT      = len(KTpts)
    nKPHI    = len(KPHIpts)

    dataFile   = workingDirectory \
               + '/total_Pion_+_dN_dypTdpTdphi_allmoms_ev_no_df.dat'
    vTdataFile = workingDirectory \
               + '/post_processing_results/total_Pion_+_quantities_to_average_no_df.dat'
    data       = np.loadtxt(dataFile).reshape([2,nKPHI,nKT])
    vTdata     = np.loadtxt(vTdataFile).reshape([2,nKPHI,nKT])
    
    KTdata = np.tile(KTpts,(nMom, nKPHI,1))
    
    KT_integrated_moments      = np.tensordot(KTwts, KTdata*data, (0,-1))
    KPHI_integrated_moments    = np.tensordot(KPHIwts, data, (0,1)) / (2.0*np.pi)
    KT_KPHI_integrated_moments = np.tensordot(KPHIwts, KT_integrated_moments, (0,-1)) / (2.0*np.pi)
    KT_integrated_vTinfo       = np.tensordot(KTwts, KTdata*data, (0,-1))
    KPHI_integrated_vTinfo     = np.tensordot(KPHIwts, data, (0,1)) / (2.0*np.pi)
    KT_KPHI_integrated_vTinfo  = np.tensordot(KPHIwts, KT_integrated_moments, (0,-1)) / (2.0*np.pi)
    
    #moments_at_KT = interp.interp1d(KTpts, KPHI_integrated_moments, kind='linear')
    #moments_at_KT = interp.interp1d(KTpts, KPHI_integrated_moments, kind='quadratic')
    moments_at_KT = interp.interp1d(KTpts, KPHI_integrated_moments, kind='cubic')
    #moments_at_KT = interp.interp1d(KTpts, KPHI_integrated_moments, kind='linear')
    #moments_at_KT = interp.interp1d(KTpts, KPHI_integrated_moments, kind='quadratic')
    vTinfo_at_KT  = interp.interp1d(KTpts, KPHI_integrated_vTinfo, kind='cubic')
    
    #print KPHI_integrated_moments
    KTintegrated_results = np.hstack((KT_KPHI_integrated_moments,KT_KPHI_integrated_vTinfo))
    
    KTvalues = np.arange(0.05, 1.0, 0.05) # GeV
    (norm, x2, y2) = moments_at_KT(KTvalues).T
    (vT2, vT) = vTinfo_at_KT(KTvalues).T
    etaf_RMS_est = np.atanh(np.sqrt(vT2))
    etaf_mean_est = np.atanh(vT)
    #print np.sqrt(0.5*(x2+y2)/norm)
    #print moments_at_KT(np.arange(0.01, 1.01, 0.1))
    
    results = np.c_[ KTvalues, norm, x2, y2, etaf_RMS_est, etaf_mean_est ]
    np.savetxt(workingDirectory + '/source_properties_vs_KT.dat', results)
    np.savetxt(workingDirectory + '/source_properties_KTintegrated.dat', KTintegrated_results)
    
    '''fig, ax = plt.subplots()
    ax.scatter(KTpts, KPHI_integrated_moments[0],color='blue')
    ax.plot(np.arange(0.01, 1.01, 0.01), moments_at_KT(np.arange(0.01, 1.01, 0.01))[0],'b-')
    
    ax.scatter(KTpts, KPHI_integrated_moments[1],color='red')
    ax.plot(np.arange(0.01, 1.01, 0.01), moments_at_KT(np.arange(0.01, 1.01, 0.01))[1],'r-')
    
    ax.scatter(KTpts, KPHI_integrated_moments[2],color='green')
    ax.plot(np.arange(0.01, 1.01, 0.01), moments_at_KT(np.arange(0.01, 1.01, 0.01))[2],'g-')
    
    ax.set_xlim(0.0, 1.0)
    
    plt.show()'''
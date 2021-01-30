HoTCoffeehControl = {
    'runHoTCoffeeh'                             :                                        True,
}

HoTCoffeehParameters = {
    'include_delta_f'                           :                                           0,
    'SV_resonanceThreshold'                     :                                         0.0,
    'CF_resonanceThreshold'                     :                                         0.0,
    'use_log_fit'                               :                                           1,
}

controlParameterList = {
    'simulation_type'                           :                                     'hydro',
    'niceness'                                  :                                           0,
}

hydroParameters = {
    'vis'                                       :                                        0.08,
    'Ivisflag'                                  :                                           0,
    'IvisBulkFlag'                              :                                           0,
    'visbulknorm'                               :                                         0.0,
    'IviscousEqsType'                           :                                           1,
    'T0'                                        :                                         0.6,
    'dt'                                        :                                        0.02,
    'Tdec'                                      :                                        0.12,
    'iLS'                                       :                                         150,
    'dx'                                        :                                         0.1,
    'dy'                                        :                                         0.1,
    'Edec'                                      :                                       0.048,
    'ndx'                                       :                                           2,
    'ndy'                                       :                                           2,
    'ndt'                                       :                                           5,
    'IhydroJetoutput'                           :                                           0,
    'InitialURead'                              :                                           0,
    'Initialpitensor'                           :                                           1,
}

iSParameters = {
    'turn_on_bulk'                              :                                           0,
    'turn_on_shear'                             :                                           1,
}

iSSParameters = {
    'turn_on_bulk'                              :                                           1,
    'include_deltaf_bulk'                       :                                           0,
    'include_deltaf_shear'                      :                                           1,
    'calculate_vn'                              :                                           1,
    'MC_sampling'                               :                                           0,
    'number_of_repeated_sampling'               :                                          10,
    'y_LB'                                      :                                        -2.5,
    'y_RB'                                      :                                         2.5,
    'sample_y_minus_eta_s_range'                :                                         2.0,
}

initial_condition_control = {
    'centrality'                                :                                      '0-1%',
    'cut_type'                                  :                             'total_entropy',
    'initial_condition_type'                    :                                   'superMC',
    'pre-generated_initial_file_path'           :                                'smooth_ICs',
    'pre-generated_initial_file_pattern'        :              'sdAvg_order_[0-9]*_block.dat',
    'pre-generated_initial_file_read_in_mode'   :                                           2,
}

photonEmissionParameters = {
    'dx'                                        :                                         0.3,
    'dy'                                        :                                         0.3,
    'dTau'                                      :                                         0.3,
    'tau_start'                                 :                                         0.6,
    'tau_end'                                   :                                        30.0,
    'T_dec'                                     :                                        0.15,
    'T_cuthigh'                                 :                                         0.8,
    'T_cutlow'                                  :                                         0.1,
    'T_sw_high'                                 :                                        0.18,
    'T_sw_low'                                  :                                      0.1795,
    'calHGIdFlag'                               :                                           0,
    'differential_flag'                         :                                           0,
    'enable_polyakov_suppression'               :                                           0,
}

preEquilibriumParameters = {
    'event_mode'                                :                                           1,
    'taumin'                                    :                                         0.6,
    'taumax'                                    :                                         0.6,
    'dtau'                                      :                                         0.2,
}

superMCControl = {
    'initialFiles'                              :                                   'sd*.dat',
}

superMCParameters = {
    'model_name'                                :                                     'MCGlb',
    'Aproj'                                     :                                           1,
    'Atarg'                                     :                                          16,
    'ecm'                                       :                                         200,
    'average_from_order'                        :                                           2,
    'average_to_order'                          :                                           2,
    'ecc_from_order'                            :                                           2,
    'ecc_to_order'                              :                                           2,
    'finalFactor'                               :                                      28.656,
    'alpha'                                     :                                        0.14,
    'lambda'                                    :                                       0.288,
    'operation'                                 :                                           3,
    'include_NN_correlation'                    :                                           1,
    'cc_fluctuation_model'                      :                                           6,
    'cc_fluctuation_Gamma_theta'                :                                        0.75,
    'maxx'                                      :                                        15.0,
    'maxy'                                      :                                        15.0,
    'dx'                                        :                                         0.1,
    'dy'                                        :                                         0.1,
    'nev'                                       :                                           1,
    'shape_of_entropy'                          :                                           3,
}


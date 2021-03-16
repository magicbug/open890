defmodule Open890Web.Live.RadioSocketState do
  @init_socket [
    {:display_band_selector, false},
    {:radio_connection, nil},
    {:connection_state, nil},
    {:data_speed, nil},
    {:debug, false},
    {:active_frequency, ""},
    {:active_mode, :unknown},
    {:active_receiver, :a},
    {:active_transmitter, :a},
    {:audio_gain, nil},
    {:audio_scope_data, []},
    {:band_scope_att, nil},
    {:band_scope_avg, nil},
    {:band_scope_data, []},
    {:band_scope_edges, nil},
    {:band_scope_mode, nil},
    {:band_scope_span, nil},
    {:display_screen_id, 0},
    {:filter_hi_shift, nil},
    {:filter_high_freq, nil},
    {:filter_lo_width, nil},
    {:filter_low_freq, nil},
    {:inactive_frequency, ""},
    {:inactive_mode, :unknown},
    {:inactive_receiver, :b},
    {:alc_meter, 0},
    {:swr_meter, 0},
    {:comp_meter, 0},
    {:id_meter, 0},
    {:vd_meter, 0},
    {:temp_meter, 0},
    {:notch_state, nil},
    {:notch_filter, nil},
    {:power_level, nil},
    {:projected_active_receiver_location, ""},
    {:ref_level, 0},
    {:rf_gain, nil},
    {:rf_pre, 0},
    {:rf_att, 0},
    {:active_if_filter, nil},
    {:roofing_filter_data, %{a: nil, b: nil, c: nil}},
    {:s_meter, 0},
    {:ssb_data_filter_mode, nil},
    {:ssb_filter_mode, nil},
    {:theme, "kenwood"},
    {:vfo_a_frequency, ""},
    {:vfo_b_frequency, ""},
    {:vfo_memory_state, nil},
    {:waterfall_draw_interval, 1}
  ]

  def initial_state do
    @init_socket |> Enum.into(%{})
  end

end

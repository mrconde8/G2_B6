  --Example instantiation for system 'AnemoAvalon'
  AnemoAvalon_inst : AnemoAvalon
    port map(
      out_port_from_the_leds => out_port_from_the_leds,
      out_pwm_from_the_avalon_pwm_0 => out_pwm_from_the_avalon_pwm_0,
      clk_0 => clk_0,
      in_freq_anemo_to_the_Anemo_SOPC_0 => in_freq_anemo_to_the_Anemo_SOPC_0,
      in_port_to_the_buttons => in_port_to_the_buttons,
      reset_n => reset_n
    );



  --Example instantiation for system 'sopcPWM'
  sopcPWM_inst : sopcPWM
    port map(
      out_port_from_the_leds => out_port_from_the_leds,
      out_pwm_from_the_avalon_pwm_0 => out_pwm_from_the_avalon_pwm_0,
      clk_0 => clk_0,
      in_port_to_the_buttons => in_port_to_the_buttons,
      reset_n => reset_n
    );



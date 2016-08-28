After('@reset-sim-nickname') do
  @current_section.reset_sim_nickname
  puts "Set SIM Nickname back to default"
end

After('@reset-recharge-pin') do
  @current_section.reset_recharge_pin
  puts "Set recharge PIN back to default"
end

After do |scenario|
  if scenario.failed?
    path = "screenshots/" + scenario.name.downcase.tr(" ", "_") + ".png"

    save_screenshot(path, :full => true)
  end
end
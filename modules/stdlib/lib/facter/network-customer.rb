Facter.add("network-custom") do
  setcode do
    Facter.value(:network)
  end
end

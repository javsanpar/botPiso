value = %x( ./loopNmap.sh )

knownMacs = Hash.new
macs = Array.new

value = value.split("MAC Address: ")
value.delete_at(0)
knownMacs["Javi"] = "74:23:44:E8:06:16"
knownMacs["Pablo"] = "10:2A:B3:EB:DE:77"
knownMacs["Alberto"] = "F8:E0:79:12:86:EC"
knownMacs["Dani"] = "68:3E:34:08:F2:D6"

value.each do |i|
  macs.insert(-1,i.match(/((\d|([a-f]|[A-F])){2}:){5}(\d|([a-f]|[A-F])){2}/x).to_s)
end

knownMacs.each do |key,value|
	if macs.include? value
		puts(key)
	end
end

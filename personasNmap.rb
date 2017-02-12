require 'json'

value = %x( ./loopNmap.sh )

knownMacs = Hash.new
macs = Array.new

value = value.split("MAC Address: ")
value.delete_at(0)

json = IO.read("knownMacs.json")
knownMacs = JSON.parse(json)

value.each do |i|
  macs.insert(-1,i.match(/((\d|([a-f]|[A-F])){2}:){5}(\d|([a-f]|[A-F])){2}/x).to_s)
end

knownMacs.each do |key,value|
  value.each do |mac|
	  if macs.include? value
	  	puts(key)
      break
    end
  end
end

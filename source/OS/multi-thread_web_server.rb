require 'thread'
require 'socket'

class RequestHandler
    def initialize(session)
    @session = session
    end

    def process
        while @session.gets.chop.length != 0
        end
        @session.puts "HTTP/1.1 200 OK"
        @session.puts "content-type: text/html"
        @session.puts "" # End of headers
        @session.puts "<html>"
        @session.puts "   <body>"
        @session.puts "     <center>"
        @session.puts "        <b>#{Time.now}</b>"
        @session.puts "     <center>"
        @session.puts "   </body>"
        @session.puts "</html>"
        @session.close
    end
end

server = TCPServer.new("0.0.0.0", "8888")
$currentRequests = []
$requestedToShutDown = false

while !$requestedToShutDown
    session = server.accept
    thread = Thread.new(session) do |newSession|
        RequestHandler.new(newSession).process
    end
    p thread.object_id
    $currentRequests.push(thread)
end
$currentRequests.each { |t| Thread.join(t) }

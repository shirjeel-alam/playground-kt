val = { post: { video_upload: ['small.mp4', Base64.encode64(File.read('tmp/small.mp4'))] } }
val = { post: { video_upload: Base64.encode64(File.read('tmp/small.mp4')) } }
uri = URI("http://lvh.me:3000/posts/1.json")
res = Net::HTTP.start(uri.host, uri.port) do |http|
  req = Net::HTTP::Put.new(uri)
  req['Content-Type'] = 'application/json'
  req.body = val.to_json
  http.request(req)
end
puts "Response #{res.code} #{res.message}"
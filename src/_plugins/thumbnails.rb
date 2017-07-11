# require "mini_magick"

# module Jekyll
#   module Thumbnails

#     class ThumbnailGenerator < Jekyll::Generator
#       safe false

#       def generate(site)
#         site.static_files.clone.each do |sf|
#           next unless sf.kind_of?(Jekyll::StaticFile) && sf.path =~ /\.jpg$|\.jpe|\.jpeg/
#           #site.static_files.delete(sf)
#           extension = File.extname(sf.path)
#           name = File.basename(sf.path, extension)
#           destination = File.dirname(sf.path)
#           image = MiniMagick::Image.open(sf.path)
#           size = site.config['width'] * 0.3
#           if (image[:width] > size) then
#             image.resize "#{size}x#{size}"
#             name = name + '_thumb'
#             image.write(destination + '/' + name + extension)
#             destination = destination.sub(site.source, '')
#             name = name + extension
#             site.static_files << StaticFile.new(site, site.source, destination, name)
#           end
#         end
#       end
#     end

#   end
# end
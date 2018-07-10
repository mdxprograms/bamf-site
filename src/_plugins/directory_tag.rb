module Jekyll
  # loops over files in a directory
  class DirectoryTag < Liquid::Block
    include Convertible

    MATCHER = %r{/^(.+\/)*(\d+-\d+-\d+)-(.*)(\.[^.]+)$/}

    attr_accessor :content, :data

    def initialize(tag_name, markup, tokens)
      attributes = {}

      # Parse parameters
      markup.scan(Liquid::TagAttributes) do |key, value|
        attributes[key] = value
      end

      @path     = attributes['path'] || '.'
      @exclude  = Regexp.new(attributes['exclude'] || '.html$', Regexp::EXTENDED | Regexp::IGNORECASE)
      @rev      = attributes['reverse'].nil?

      super
    end

    def render(context)
      context.registers[:directory] ||= Hash.new(0)

      source_dir = context.registers[:site].source
      listed_dir = File.expand_path(File.join(source_dir, @path))

      unless listed_dir.index(source_dir)
        raise ArgumentError, "Listed directory '#{listed_dir}' cannot be out of jekyll root"
      end

      directory_files = File.join(listed_dir, '*')
      files = Dir.glob(directory_files).reject { |f| f =~ @exclude }
      files.sort! { |x, y| @rev ? x <=> y : y <=> x }

      length = files.length
      result = []

      context.stack do
        files.each_with_index do |filename, index|
          basename = File.basename(filename)

          filepath = [@path, basename] - ['.']
          path = filepath.join '/'
          url  = '/' + filepath.join('/')

          m, _, date, slug, ext = *basename.match(MATCHER)

          if m
            date = Time.parse(date)
            slug = slug
          else
            date = File.ctime(filename)
            ext = File.extname(basename)
            slug = ext ? basename.sub(ext, '') : basename
          end

          context['file'] = {
            'date' => date,
            'name' => basename,
            'slug' => slug,
            'url' => url
          }

          context['forloop'] = {
            'name' => 'directory',
            'length' => length,
            'index' => index + 1,
            'index0' => index,
            'rindex' => length - index,
            'rindex0' => length - index - 1,
            'first' => index.zero?,
            'last' => (index == length - 1)
          }

          result << render(@nodelist, context)
        end
      end
      result
    end
  end
end

Liquid::Template.register_tag('directory', Jekyll::DirectoryTag)

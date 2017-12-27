require 'pronto'
require 'image_optim'

module Pronto
  class ImageOptim < Runner
    def initialize(*args)
      super

      @image_optim = ::ImageOptim.new
    end

    # Entry point to our Pronto runner
    def run
      return [] unless @patches

      @patches.select(&method(:valid_patch?))
              .map(&method(:inspect))
              .flatten
              .compact
    end

    private

    def valid_patch?(patch)
      path = patch.new_file_full_path
      image_file?(path)
    end

    def inspect(patch)
      path = patch.new_file_full_path
      size = File.size(path)

      optimized_path = @image_optim.optimize_image(path)
      return unless optimized_path

      optimized_size = File.size(optimized_path)
      return unless optimized_size < size

      percent = 100 - (100.0 / size * optimized_size)

      Message.new(path, nil, :info, "File size can be reduced by #{percent.round(2)}%", nil, self.class)
    end

    def image_file?(path)
      %w[.png .jpg .jpeg].include?(File.extname(path))
    end
  end
end

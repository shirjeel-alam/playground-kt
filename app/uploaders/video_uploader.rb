class VideoUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay
  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :mp4 do
    process encode: [:mp4]
    
    def full_filename(for_file)
      super.chomp(File.extname(super)) + '.mp4'
    end
  end

  version :webm do
    process encode: [:webm]
    
    def full_filename(for_file)
      super.chomp(File.extname(super)) + '.webm'
    end
  end

  version :thumbnail do
    process encode: [:jpg]
    
    def full_filename(for_file)
      super.chomp(File.extname(super)) + '.jpg'
    end
  end

  def encode format, opts = {}
    tmp_path = File.join File.dirname(current_path), "tmp_file.#{format}"
    case format
    when :mp4
      system("ffmpeg -i #{current_path} -c:v libx264 -preset slow #{tmp_path}")
    when :webm
      system("ffmpeg -i #{current_path} -c:v libvpx -b:v 2M #{tmp_path}")
    when :jpg
      system("ffmpeg -i #{current_path} -vframes 1 -qscale:v 1 #{tmp_path}")
    end
    File.rename tmp_path, current_path
  end

end

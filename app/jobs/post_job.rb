class PostJob < ActiveJob::Base
  include ::CarrierWave::Workers::ProcessAssetMixin
end

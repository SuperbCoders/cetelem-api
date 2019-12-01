class DealerCarUploadJob < ApplicationJob
  queue_as :default

  def perform(*args)
    args[0].update(status: :in_process)
    path = ActiveStorage::Blob.service.send(:path_for, args[0].key)
    ::DealerCarUpload.call(path, dealer: args[1])
    args[0].update(status: :done)
  end
end

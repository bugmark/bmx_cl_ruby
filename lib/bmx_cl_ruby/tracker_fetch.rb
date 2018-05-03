require 'iora'

module BmxClRuby
  class TrackerFetch

    attr_reader :data_source, :tracker_data

    def initialize(data_source)
      @data_source = data_source
    end

    def fetch
      iora = get_iora(data_source)
      iora.issues
    end

    private

    def get_iora(source)
      @iora = begin
        type, id = source.split(":")
        Iora.new(type, id)
      end
    end
  end
end

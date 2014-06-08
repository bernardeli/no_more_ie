module NoMoreIe
  class Configuration
    attr_accessor :ie_versions, :html_response

    def initialize(args = {})
      @ie_versions   = args[:ie_versions] || defaults[:ie_versions]
      @html_response = args[:html_response] || defaults[:html_response]
    end

    private

    def defaults
      { ie_versions: [6, 7, 8, 9, 10],
        html_response: File.join(File.dirname(__FILE__), "no_more_ie.html") }
    end
  end
end


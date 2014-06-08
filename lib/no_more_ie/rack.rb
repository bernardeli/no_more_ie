module NoMoreIe
  class Rack
    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      if ie_request?(env)
        redirect_to NoMoreIe.configuration.html_response
      else
        @status, @headers, @response = @app.call(env)
        [@status, @headers, @response]
      end
    end

    private

    def redirect_to(html_response)
      body = File.read(html_response)
      [302, {"Content-Type" => "text/html", "Content-Length" => body.length.to_s}, [body]]
    end

    def ie_request?(env)
      env['HTTP_USER_AGENT'] =~ /Chrome/
    end
  end
end

require 'haml'

def haml(template)
  file_path = File.join(File.expand_path(__dir__), 'views', "#{template}.haml")
  haml_data = File.read(file_path)
  render html: Haml::Engine.new(haml_data).render
end
# require 'cool-gem'

# To deploy this function, cd into its folder and run:
# faastruby deploy-to WORKSPACE_NAME
def handler(_event)
  # The 'event' argument has the following attributes
  # event.body - The request body
  # event.context - The execution context
  # event.headers - The request headers
  # event.query_params - The query params

  # FUNCTION RESPONSE
  #
  # You can render text, json, yaml, html or js. Example:
  # render html: '<p>Hello World!</p>'
  # render yaml: {hello: 'world!'}
  #
  # Status:
  # The default status is 200. You can set a custom status like this:
  # render json: {error: 'Could not perform the action'}, status: 422
  #
  # Headers:
  # The 'Content-Type' header is automatically set when you use 'render'.
  # You can set custom headers using a hash with string keys. Example:
  # render text: 'It Works!', headers: {'TransactionId' => 23928}
  haml :index
end

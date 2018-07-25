# This monkey-patch is to override the rails-jquery-autocomplete gem's autocomplete method used in the controller.
# The reason this monkey-patch was introduced is to allow for a complete list of items to be listed when the search
# term is blank.
module ClassMethods
  def autocomplete(object, method, options = {}, &block)

    define_method("get_prefix") do |model|
      if defined?(Mongoid::Document) && model.include?(Mongoid::Document)
        'mongoid'
      elsif defined?(MongoMapper::Document) && model.include?(MongoMapper::Document)
        'mongo_mapper'
      else
        'active_record'
      end
    end
    define_method("get_autocomplete_order") do |method, options, model=nil|
      method("#{get_prefix(get_object(options[:class_name] || object))}_get_autocomplete_order").call(method, options, model)
    end

    define_method("get_autocomplete_items") do |parameters|
      method("#{get_prefix(get_object(options[:class_name] || object))}_get_autocomplete_items").call(parameters)
    end

    define_method("autocomplete_#{object}_#{method}") do

      method = options[:column_name] if options.has_key?(:column_name)

      term = params[:term]

      class_name = options[:class_name] || object
      items = get_autocomplete_items(:model => get_object(class_name), :options => options, :term => term, :method => method)

      render :json => json_for_autocomplete(items, options[:display_value] ||= method, options[:extra_data], &block), root: false
    end
  end
end
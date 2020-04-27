ActiveSupport.on_load(:action_controller) do
    require 'active_model_serializers/register_json_renderer'
  end
  
  ActiveModelSerializers.config.adapter = :json
Rails.configuration.to_prepare do
  puts "Including Model::Ecm::Rbac::UserConcern in #{Ecm::Rbac.user_class_name}"
  Ecm::Rbac.user_class_name.constantize.class_eval do
    include Model::Ecm::Rbac::UserConcern
  end
end
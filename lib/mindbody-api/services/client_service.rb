module MindBody
  module Services
    class ClientService < Service
      service 'ClientService'

      operation :add_arrival,                    :required => [:client_id, :location_id],                                   :locals => false
      operation :add_or_update_clients,          :required => [:clients]
      operation :get_clients
      operation :get_custom_client_fields,                                                                                  :locals => false
      operation :get_client_indexes,                                                                                        :locals => false
      operation :get_client_contact_logs,        :required => [:client_id]
      operation :add_or_update_contact_logs,     :required => [:contact_logs]
      operation :get_contact_log_types,                                                                                     :locals => false
      operation :upload_client_document,         :required => [:client_id, :filename, :bytes]
      operation :get_client_referral_types,                                                                                 :locals => false
      operation :get_active_client_memberships,  :required => [:client_id]
      operation :get_client_contracts,           :required => [:client_id]
      operation :get_client_account_balances,    :required => [:client_ids]
      operation :get_client_services,            :required => [:client_id]
      operation :get_client_visits,              :required => [:client_id]
      operation :get_client_purchases,           :required => [:client_id]
      operation :get_client_schedule,            :required => [:client_id]
      operation :get_required_client_fields,                                                                                :locals => false
      operation :validate_login,                 :required => [:username, :password],                                       :locals => false
      operation :update_client_services,         :required => [:client_services]
      operation :send_user_new_password,         :required => [:user_email, :user_first_name, :user_last_name],             :locals => false
    end
  end
end


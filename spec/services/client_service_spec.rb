require 'spec_helper'

describe MindBody::Services::ClientService do
  subject { MindBody::Services::ClientService }

  it { should respond_to(:add_arrival) }
  it { should respond_to(:add_or_update_clients) }
  it { should respond_to(:get_clients) }
  it { should respond_to(:get_custom_client_fields) }
  it { should respond_to(:get_client_indexes) }
  it { should respond_to(:get_client_contact_logs) }
  it { should respond_to(:add_or_update_contact_logs) }
  it { should respond_to(:get_contact_log_types) }
  it { should respond_to(:upload_client_document) }
  it { should respond_to(:get_client_referral_types) }
  it { should respond_to(:get_active_client_memberships) }
  it { should respond_to(:get_client_contracts) }
  it { should respond_to(:get_client_account_balances) }
  it { should respond_to(:get_client_services) }
  it { should respond_to(:get_client_visits) }
  it { should respond_to(:get_client_purchases) }
  it { should respond_to(:get_client_schedule) }
  it { should respond_to(:get_required_client_fields) }
  it { should respond_to(:validate_login) }
  it { should respond_to(:update_client_services) }
  it { should respond_to(:send_user_new_password) }
end

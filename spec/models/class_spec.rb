require 'spec_helper'

describe MindBody::Models::Class do
  it { should respond_to(:id) }
  it { should respond_to(:class_schedule_id) }
  it { should respond_to(:visits) }
  it { should respond_to(:clients) }
  it { should respond_to(:location) }
  it { should respond_to(:max_capacity) }
  it { should respond_to(:web_capacity) }
  it { should respond_to(:total_booked) }
  it { should respond_to(:web_booked) }
  it { should respond_to(:semester_id) }
  it { should respond_to(:is_canceled) }
  it { should respond_to(:substitute) }
  it { should respond_to(:active) }
  it { should respond_to(:is_waitlist_available) }
  it { should respond_to(:is_enrolled) }
  it { should respond_to(:hide_cancel) }
  it { should respond_to(:is_available) }
  it { should respond_to(:start_date_time) }
  it { should respond_to(:end_date_time) }
  it { should respond_to(:class_description) }
  it { should respond_to(:staff) }
end

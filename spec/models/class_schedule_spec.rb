require 'spec_helper'

describe MindBody::Models::ClassSchedule do
  it { should respond_to(:id) }
  it { should respond_to(:classes) }
  it { should respond_to(:clients) }
  it { should respond_to(:course) }
  it { should respond_to(:semester_id) }
  it { should respond_to(:is_available) }
  it { should respond_to(:class_description) }
  it { should respond_to(:day_sunday) }
  it { should respond_to(:day_monday) }
  it { should respond_to(:day_tuesday) }
  it { should respond_to(:day_wednesday) }
  it { should respond_to(:day_thursday) }
  it { should respond_to(:day_friday) }
  it { should respond_to(:day_saturday) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:start_date) }
  it { should respond_to(:end_date) }
  it { should respond_to(:staff) }
  it { should respond_to(:location) }
end

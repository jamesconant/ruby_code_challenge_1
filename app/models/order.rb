class Order < ActiveRecord::Base
  attr_accessible :delivery_time_utc

  def lunch_time
    meal_time('11:30AM','3:00PM')
  end

  def dinner_time
    meal_time('5:30PM','10:00PM')
  end

  def meal_time(start_time,end_time)
    # expects start_time and end_time to be in "11:45AM" or "1:15PM" format
    int_start_time = build_int_time(start_time)
    int_end_time = build_int_time(end_time)
    time_hash = {}
    (int_start_time..int_end_time).step(15.minutes).each do |t|
      time_hash[Time.at(t).strftime("%I:%M%p")] = t
    end
    time_hash
  end

private

  def build_int_time(time)
    # expects time to be in "11:45AM" or "1:15PM" format
    date = Time.at(delivery_time_utc)
    time = Time.strptime(time, "%I:%M%p")
    Time.new(date.year, date.month, date.day, time.hour, time.min).to_i
  end
end
require 'spec_helper'

describe Order do
  describe "#meal_time(start_time,end_time)" do
    context "given start_time of '11:45AM' and end_time of '12:15PM' and a 
            delivery_time_utc value of 1370538498 " do
      it "returns { '11:45AM' => 1370533500,
                    '12:00PM' => 1370534400,
                    '12:15PM' => 1370535300 }" do
        order = Order.new(delivery_time_utc: 1370538498)
        order.meal_time('11:45AM','12:15PM').should == {'11:45AM' => 1370533500,
                                                        '12:00PM' => 1370534400,
                                                        '12:15PM' => 1370535300}
      end

      it "contains exactly three hash pairs" do
        order = Order.new(delivery_time_utc: 1370538498)
        order.meal_time('11:45AM','12:15PM').count.should == 3
      end
    end
  end
end
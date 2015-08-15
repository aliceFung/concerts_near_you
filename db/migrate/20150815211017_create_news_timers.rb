class CreateNewsTimers < ActiveRecord::Migration
  def change
    create_table :news_timers do |t|
      t.datetime :mailed_at, :null => false, :default => Time.now + 1.day
      t.integer  :user_id 

      t.timestamps null: false
    end
  end
end

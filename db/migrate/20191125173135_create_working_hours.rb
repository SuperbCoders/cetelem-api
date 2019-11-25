class CreateWorkingHours < ActiveRecord::Migration[6.0]
  def change
    create_table :working_hours do |t|
      t.string :mon_fr_from
      t.string :mon_fr_till
      t.string :sat_from
      t.string :sat_till
      t.string :sun_from
      t.string :sun_till

      t.timestamps
    end
  end
end

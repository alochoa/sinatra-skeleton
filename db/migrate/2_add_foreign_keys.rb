class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :movies do |t|
            t.references :user #user that created 
            t.references :actor
        end

        change_table :reviews do |t|
        	t.references :user
            t.references :movie
        end

        change_table :comments do |t|
        	t.references :user
            t.references :movie
        end

    end
end
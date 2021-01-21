require 'test_helper'

module Admin
  class AdminTablesControllerTest < ActionDispatch::IntegrationTest
    def test_index
      get admin_tables_path()
      assert_response :success
      assert_select 'table td.col-id', text: @record.id.to_s, count: 1
    end

    private

    def setup
      super
      @record = Table.create!
    end
  end
end

require 'test_helper'

class MemoryLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @memory_log = memory_logs(:one)
  end

  test "should get index" do
    get memory_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_memory_log_url
    assert_response :success
  end

  test "should create memory_log" do
    assert_difference('MemoryLog.count') do
      post memory_logs_url, params: { memory_log: { description: @memory_log.description, timestamp: @memory_log.timestamp, user: @memory_log.user } }
    end

    assert_redirected_to memory_log_url(MemoryLog.last)
  end

  test "should show memory_log" do
    get memory_log_url(@memory_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_memory_log_url(@memory_log)
    assert_response :success
  end

  test "should update memory_log" do
    patch memory_log_url(@memory_log), params: { memory_log: { description: @memory_log.description, timestamp: @memory_log.timestamp, user: @memory_log.user } }
    assert_redirected_to memory_log_url(@memory_log)
  end

  test "should destroy memory_log" do
    assert_difference('MemoryLog.count', -1) do
      delete memory_log_url(@memory_log)
    end

    assert_redirected_to memory_logs_url
  end
end

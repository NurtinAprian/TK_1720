##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'WorkflowStatistics' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .statistics().fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workflows/WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Statistics",
          "cumulative": {
              "avg_task_acceptance_time": 0.0,
              "end_time": "2008-01-02T00:00:00Z",
              "reservations_accepted": 0,
              "reservations_rejected": 0,
              "reservations_timed_out": 0,
              "start_time": "2008-01-02T00:00:00Z",
              "tasks_canceled": 0,
              "tasks_entered": 0,
              "tasks_moved": 0,
              "tasks_timed_out_in_workflow": 0
          },
          "realtime": {
              "longest_task_waiting_age": 0,
              "longest_task_waiting_sid": null,
              "tasks_by_status": {
                  "assigned": 1,
                  "pending": 0,
                  "reserved": 0,
                  "wrapping": 0
              },
              "total_tasks": 1
          },
          "workflow_sid": "WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workflows("WWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .statistics().fetch()

    expect(actual).to_not eq(nil)
  end
end
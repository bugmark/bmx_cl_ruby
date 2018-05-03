require 'json'
require 'iora'

describe "tracker/issues" do
  # describe "tracker" do
  #   it "resets the system" do
  #     result = `bmx host rebuild --affirm=destroy_all_data`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "generates a test tracker" do
  #     result = `bmx tracker create Binger --type=Test`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "returns the right count" do
  #     result = JSON.parse(`bmx host counts`)
  #     expect(result["trackers"]).to eq(1)
  #   end
  # end
  #
  # describe "issues" do
  #   it "resets the system and generates a tracker" do
  #     result = `bmx host rebuild --affirm=destroy_all_data`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #     result = `bmx tracker create Banger --type=Test`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "generates a test issue" do
  #     tracker_uuid = JSON.parse(`bmx tracker list`).first["uuid"]
  #     result = `bmx issue sync EXID1 --tracker-uuid=#{tracker_uuid} --status=open`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "returns the right count" do
  #     result = JSON.parse(`bmx host counts`)
  #     expect(result["issues"]).to eq(1)
  #   end
  #
  #   it "lists issues" do
  #     result = JSON.parse(`bmx issue list`)
  #     expect(result.length).to eq(1)
  #   end
  #
  #   it "shows an issue" do
  #     result = JSON.parse(`bmx issue list`)
  #     uuid   = result.first["uuid"]
  #     result = JSON.parse(`bmx issue show #{uuid}`)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "updates an issue" do
  #     status = JSON.parse(`bmx issue show EXID1`)["stm_status"]
  #     expect(status).to eq("open")
  #     result = JSON.parse(`bmx issue sync EXID1 --status=closed`)
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #     status = JSON.parse(`bmx issue show EXID1`)["stm_status"]
  #     expect(status).to eq("closed")
  #   end
  # end

  describe "tracker sync" do

    it "resets the system and generates a tracker" do
      result = `bmx host rebuild --affirm=destroy_all_data`
      expect($?.exitstatus).to eq(0)
      expect(result).to_not be_nil
      result = `bmx tracker create Banger --type=Test`
      expect($?.exitstatus).to eq(0)
      expect(result).to_not be_nil
    end

    it "loads the issue oracle" do
      tracker = Iora.new(:yaml, "spec/data/test1.yml")
      expect(tracker.issues.length).to eq(2)
    end

    it "generates a test issue" do
      puts "ASDF QWER"
      tracker_name = JSON.parse(`bmx tracker list`).first["name"]
      result = `bmx tracker sync #{tracker_name} --source='yaml:spec/data/test1.yml'`
      puts result
      # expect($?.exitstatus).to eq(1)
      expect(result).to_not be_nil
    end

  end

end

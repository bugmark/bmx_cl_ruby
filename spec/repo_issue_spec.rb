require 'json'
require 'iora'

describe "repo/issues" do
  # describe "repo" do
  #   it "resets the system" do
  #     result = `bmx host rebuild --affirm=destroy_all_data`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "generates a test repo" do
  #     result = `bmx repo create Binger --type=Test`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "returns the right count" do
  #     result = JSON.parse(`bmx host counts`)
  #     expect(result["repos"]).to eq(1)
  #   end
  # end
  #
  # describe "issues" do
  #   it "resets the system and generates a repo" do
  #     result = `bmx host rebuild --affirm=destroy_all_data`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #     result = `bmx repo create Banger --type=Test`
  #     expect($?.exitstatus).to eq(0)
  #     expect(result).to_not be_nil
  #   end
  #
  #   it "generates a test issue" do
  #     repo_uuid = JSON.parse(`bmx repo list`).first["uuid"]
  #     result = `bmx issue sync EXID1 --repo-uuid=#{repo_uuid} --status=open`
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

  describe "repo sync" do

    it "resets the system and generates a repo" do
      result = `bmx host rebuild --affirm=destroy_all_data`
      expect($?.exitstatus).to eq(0)
      expect(result).to_not be_nil
      result = `bmx repo create Banger --type=Test`
      expect($?.exitstatus).to eq(0)
      expect(result).to_not be_nil
    end

    it "loads the issue oracle" do
      repo = Iora.new(:yaml, "spec/data/test1.yml")
      expect(repo.issues.length).to eq(2)
    end

    it "generates a test issue" do
      puts "ASDF QWER"
      repo_name = JSON.parse(`bmx repo list`).first["name"]
      result = `bmx repo sync #{repo_name} --source='yaml:spec/data/test1.yml'`
      puts result
      # expect($?.exitstatus).to eq(1)
      expect(result).to_not be_nil
    end

  end

end

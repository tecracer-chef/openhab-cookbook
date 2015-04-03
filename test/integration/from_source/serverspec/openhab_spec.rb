require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'openhab' do
  it "creates the directory" do
    expect(file '/opt/openhab').to be_directory
  end

  it "has some enabled plugins" do
    expect(file '/opt/openhab/addons/org.openhab.action.xbmc-1.6.2.jar').to be_file
    expect(file '/opt/openhab/addons/org.openhab.binding.xbmc-1.6.2.jar').to be_file
  end

  it "has some disabled plugins" do
    expect(file '/opt/openhab/disabled-addons/org.openhab.binding.mqtt-1.6.2.jar').to be_file
  end
end

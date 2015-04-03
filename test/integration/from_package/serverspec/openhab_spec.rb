require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'openhab' do
  it "installs the openhab package" do
    expect(package 'openhab-runtime').to be_installed
  end

  it "installs the requested plugins" do
    expect(package 'openhab-addon-action-xbmc').to  be_installed
    expect(package 'openhab-addon-binding-xbmc').to be_installed
  end

  it "serves" do
    expect(service :openhab).to be_running
    expect(port 8080).to be_listening
  end
end

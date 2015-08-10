# openhab-cookbook

This installs [openhab](http://www.openhab.org/) and selected plugins.  You can either install via the debian packages, or from source.

### Dependencies

- Cookbooks:
  - apt
  - java
- On the system:
 - apt updated (including `apt` in the run-list will do this)
 - java 8 installed
   - this cookbook will install java for you by default - make sure to set the attributes for oracle v8

## Supported Platforms

Tested succesful on:

- Ubuntu 12.04
- Ubuntu 14.04
- Raspbian (source-only)

## Recipies

- `openhab` - Installs openhab
- `openhab::init_script` - Installs openhab init.d script
- `openhab::my_openhab`  - Installs my.openhab addon .jar

## Attributes

### Global

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openhab']['install_java']</tt></td>
    <td>Boolean</td>
    <td>Whether to install java via the java cookbook</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['openhab']['install_method']</tt></td>
    <td>String</td>
    <td>Whether to install openhab via the deb packages (default) or via 'source'</td>
    <td><tt>'package'</tt></td>
  </tr>
  <tr>
    <td><tt>['openhab']['version']</tt></td>
    <td>String</td>
    <td>What version of openhab to install</td>
    <td><tt>1.7.1</tt></td>
  </tr>
  <tr>
    <td><tt>['openhab']['plugins']</tt></td>
    <td>Array</td>
    <td>List of plugins to install</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

### Init script install only

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openhab']['http_port']</tt></td>
    <td>String</td>
    <td>HTTP Port for the init script</td>
    <td><tt>8080</tt></td>
  </tr>
  <tr>
    <td><tt>['openhab']['https_port']</tt></td>
    <td>String</td>
    <td>HTTPS Port for the init script</td>
    <td><tt>8443</tt></td>
  </tr>
</table>

### Source install only

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openhab']['install_dir']</tt></td>
    <td>String</td>
    <td>Which directoy to install 'openhab' into</td>
    <td><tt>'/opt'</tt></td>
  </tr>
  <tr>
    <td><tt>['openhab']['user']</tt></td>
    <td>String</td>
    <td>What user to run install as</td>
    <td><tt>root</tt></td>
  </tr>
  <tr>
    <td><tt>['openhab']['group']</tt></td>
    <td>String</td>
    <td>What user to run install as</td>
    <td><tt>root</tt></td>
  </tr>
</table>

### my.openHAB plugin

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['openhab']['my']['version']</tt></td>
    <td>String</td>
    <td>Which version of the my.openhab plugin to install</td>
    <td><tt>1.7.0</tt></td>
  </tr>
</table>

## Usage

- 1. Make sure you have Java setup:

```ruby
{
  attributes: {
    java: {
      install_flavor: 'oracle',
      jdk_version: '8',
      oracle: {accept_oracle_download_terms: true}
    }
  }
}
```

- 2. Pick some plugins:

```ruby
{
  attributes: {
    openhab: {
      plugins: %w{binding-xbmc action-xbmc binding-twitter persistance-mysql}
    }
  }
}
```

- 3. Include `openhab` in your node's run_list:

```ruby
{
  "run_list": [
    "recipe[apt]",
    "recipe[openhab]"
  ]
}
```

- 4. ???
- 5. Profit!

You now have OpenHAB installed.  If you did it from the packages, you have the init.d script set up and openhab running already.

### Init script

If you want to install an init.d script for booting, use the `openhab::init_script` recipie.  Currently only Raspbian is supported.

### my.openhab plugin

If you want to install the myOpenHABplugin, run the `openhab::my_openhab` recipie - it will place the requested .jar in the addons dir.

You'll still need to set/get the uuid/secret registration yourself.

## License and Authors

Author:: [Justin Aiken](https://github.com/JustinAiken)

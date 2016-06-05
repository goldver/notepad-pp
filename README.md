notepad-pp Cookbook
==================

This cookbook installs Notepad++.
Default version installed is latest available.

Supported versions can be found at: [https://notepad-plus-plus.org/repository/]

Attributes
==================
#### notepad-pp::default

| Key | Type | Description | Default |
| --- | ---- | ----------- | ------- |
| ['notepad-pp']['version'] | String | application version | 'latest' |
| ['notepad-pp']['proxy'] | String | application version | ' ' |
| ['notepad-pp']['install_dir'] | String | installation dir | 'default' |

Usage
==================
#### 'notepad-pp'::default

Just include `notepad-pp` in your cookbook:

    include_recipe 'notepad-pp'
	
If you wish to install a specific version e.g: 6.8.8

	{
	  "notepad-pp": {
	    "version": "6.8.8"
	  }    
	}

If you wish to install to a specific install directory e.g: C:\temp
You have to use "\\\\" instead of "\" in the path of the directory

	{
	  "notepad-pp": {
	    "install_dir": "C:\\temp"
	  }    
	}
	
Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Michael Vershinin

Support
-------------------
goldver@gmail.com
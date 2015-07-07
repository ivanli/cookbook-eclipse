eclipse Cookbook
================
Installs eclipse IDE from a zip file. Allows plugins to be configured as well.

Requirements
------------
Runs on windows. The archived file should have 'eclipse' as it's first directory, like this:
````
file.zip
  |- eclipse
    |- <folder with eclipse.exe>
````

#### packages
- `windows` - eclipse needs windows to extract zip files & set environment path.
- `java` - eclipse needs java to run.

Attributes
----------
````
default['eclipse']['out_path'] = "c:/tools/eclipse"
default['eclipse']['zip_path'] = "c:/vagrant/installers/eclipse-java-luna-SR2-win32.zip"
default['eclipse']['plugins'] = [{ <update site>, <package qualifier> }, ...]
````

Usage
-----
Just include `eclipse` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[eclipse]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Ivan Li

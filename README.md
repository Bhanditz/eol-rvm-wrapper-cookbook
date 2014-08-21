eol-rvm-wrapper Cookbook
========================
Creates firewall rules for rvm package using data bag

Requirements
------------
It should work on Ubuntu Linux platrorm

Usage
-----
#### eol-rvm-wrapper::default

Two things have to be done t use this cookbook

- Node run list has to inlude eol-rvm-wrapper recipe:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[eol-rvm-wrapper]"
  ]
}
```
- firewall rules have to be added to eol-rvm-wrapper/config.json data bag:


```json
{
  "_readme": "Information to create firewall rules",
  "id": "config",
  "rvm_ruby": {
    "ruby-2.1.1": {
      "nodes": []
    },
    "ruby-1.8.7-p333": {
      "nodes": ["old_node"],
      "action": "install"
    }
  },
  "rvm_default_ruby": {
    "ruby-2.1.1": {
      "nodes": []
    }
    "ruby-1.8.7-p333": {
      "nodes": ["old_node"]
    }
  }
}
```

When "nodes" array is left empty - this port will be open for all nodes
eol-rvm-wrapper recipe. Otherwise host will not apply ports
which do not contain its node name

Athors
-------------------

[Dmitry Mozzherin][1]

Copyright
---------

Copyright (c) 2014 Marine Biological Laboratory. See LICENSE.txt for
further details.

[1]: https://github.com/dimus


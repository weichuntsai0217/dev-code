# dev-code
My develop environment for Python, Node.js, C/C++, and Java based on weichuntsai/dev-base.

## Installation
```
$ docker pull weichuntsai/dev-code:1.0
```

## Python usage

### Python version management
We use `python-build` to manage python versions.
Here we just list basic usage.

* Check what python version I can install
```
$ python-build --definitions
```

* Install different python versions
```
$ python-build ${version} ${directory}
```

For example, I want to install python 2.7.4 in the directory `~/python-versions/2.7.4`
```
$ python-build 2.7.4 ~/python-versions/2.7.4
```

For more information, please refer to [python-build](https://github.com/pyenv/pyenv/tree/master/plugins/python-build)

### Module management
We use `pipenv` to manage python modules for each project.
For more information, please refer to [pipenv](https://github.com/pypa/pipenv).

## Node.js usage

### Node.js version management
We do NOT use `nvm` to manage different node versions because
the compatability of newer version node is OK for older versions
(at least for web front-end development).

### Module management
You can use `npm` or `yarn` to manage node modules for each project.
For more information, please refer to [npm](https://www.npmjs.com/) and [yarn](https://yarnpkg.com/en/).
Note that the `yarn` version shipped with this image is not the latest.
If you want to remove older `yarn` and install the latest version,
Please run the following command in the container:
```
$ /install-latest-yarn-eslint.sh
```

### Style check
```
$ eslint ${js_file}
```

For example,
```
$ eslint index.js
```

## Java usage
We use `maven` as the module manager and set `JAVA_HOME` properly.
For details, please refer to `/root/.bashrc`.

## C/C++ usage
Use `gcc` or `g++` to compile your C or C++ code.


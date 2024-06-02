# DITA Bootstrap Table

<a href="https://www.dita-ot.org"><img src="https://www.dita-ot.org/images/dita-ot-logo.svg" align="right" height="55"></a>

_DITA Bootstrap Table_ is a [DITA Open Toolkit plug-in](https://www.dita-ot.org/plugins) that extends the [DITA Bootstrap](https://infotexture.github.io/dita-bootstrap/) HTML output with additional features from the [Bootstrap Table](https://bootstrap-table.com) library.

<!-- MarkdownTOC levels="2,3" -->

- [Installation](#installation)
  - [Installing DITA-OT](#installing-dita-ot)
  - [Installing the Plug-in](#installing-the-plug-in)
- [Using](#using)
- [License](#license)

<!-- /MarkdownTOC -->

## Installation

The _DITA Bootstrap Table_ plug-in has been tested with [DITA-OT 4.x](https://www.dita-ot.org/download). Use the latest version for best results.

### Installing DITA-OT

1.  Download the latest distribution package from the project website at
    [dita-ot.org/download](https://www.dita-ot.org/download).
2.  Extract the contents of the package to the directory where you want to install DITA-OT.
3.  **Optional**: Add the absolute path for the `bin` directory to the _PATH_ system variable.

    This defines the necessary environment variable to run the `dita` command from the command line.

See the [DITA-OT documentation](https://www.dita-ot.org/dev/topics/installing-client.html) for detailed installation instructions.

### Installing the Plug-in

- Run the plug-in installation commands:

```console
dita install fox.jason.extend.css
dita install dita-bootstrap
dita install https://github.com/infotexture/dita-bootstrap.table/archive/develop.zip
```

## Using

Specify the `html5-bootstrap` format when building output with the `dita` command:

```console
dita --input=path/to/your.ditamap \
     --format=html5-bootstrap
```

## License

[Apache 2.0](LICENSE) © 2024 Jason Fox

The generated HTML created by this software includes the following additional software components which are obtained under license:

- Bootstrap Table – https://github.com/wenzhixin/bootstrap-table/ – **MIT license**

Within the documentation, where necessary, the texts describing the usage of each component have been copied directly from the [Bootstrap Table documentation](https://bootstrap-table.com/), however DITA markup is used throughout the examples describing how to implement these components correctly using `otherprops`. The text is therefore a derivative of "Bootstrap Table docs" by the Bootstrap Table team, and used under MIT.
